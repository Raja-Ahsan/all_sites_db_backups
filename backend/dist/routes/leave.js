import express from "express";
import { query, transaction } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
import { requirePermission } from "../middleware/rbac.js";
import { getAccessibleEmployeeIds, canViewEmployee } from "../middleware/departmentAccess.js";
const router = express.Router();
/**
 * GET /api/leave
 * Get all leave requests (filtered by department access)
 * - Employees: Can only see their own leave requests
 * - Department Leads: Can only see leave requests from employees in their department
 * - Admins/HR/Managers: Can see all leave requests
 */
router.get("/", authenticate, requirePermission("leave:read"), async (req, res) => {
    try {
        const user = req.user;
        const { status, employeeId } = req.query;
        // Get accessible employee IDs based on user's role and department
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(user.id);
        let sql = `
      SELECT 
        lr.*,
        e.firstName,
        e.lastName,
        e.employeeId,
        e.departmentId,
        d.name as departmentName,
        approver.firstName as approverFirstName,
        approver.lastName as approverLastName
      FROM leave_requests lr
      JOIN employees e ON lr.employeeId = e.id
      LEFT JOIN departments d ON e.departmentId = d.id
      LEFT JOIN employees approver ON lr.approvedBy = approver.id
    `;
        const params = [];
        const conditions = [];
        // Apply department-based filtering
        if (accessibleEmployeeIds !== null) {
            // null means user can view all (Admin/HR/Manager)
            if (accessibleEmployeeIds.length === 0) {
                // No access - return empty array
                return res.json({ success: true, data: [] });
            }
            // Filter by accessible employee IDs
            const placeholders = accessibleEmployeeIds.map(() => '?').join(',');
            conditions.push(`lr.employeeId IN (${placeholders})`);
            params.push(...accessibleEmployeeIds);
        }
        if (status) {
            conditions.push("lr.status = ?");
            params.push(status);
        }
        // If employeeId is provided, ensure user has access to that employee's requests
        if (employeeId) {
            // Ensure employeeId is a string (handle query parameter type)
            const employeeIdStr = Array.isArray(employeeId) ? employeeId[0] : employeeId;
            const employeeIdString = typeof employeeIdStr === 'string' ? employeeIdStr : String(employeeIdStr);
            if (accessibleEmployeeIds !== null && !accessibleEmployeeIds.includes(employeeIdString)) {
                // User doesn't have access to this employee's leave requests
                return res.status(403).json({
                    success: false,
                    error: "Access denied. You can only view leave requests for employees in your department."
                });
            }
            conditions.push("lr.employeeId = ?");
            params.push(employeeIdString);
        }
        if (conditions.length > 0) {
            sql += " WHERE " + conditions.join(" AND ");
        }
        sql += " ORDER BY lr.createdAt DESC";
        const leaves = await query(sql, params);
        res.json({ success: true, data: leaves });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/leave
 * Create leave request
 *
 * Change: Allow HR/Admin (users with leave:approve) to create leave on behalf of any employee.
 * Additionally, allow Department Leads (users with leave:create but not approve) to create leave
 * on behalf of employees in their own department. All such access is enforced via
 * getAccessibleEmployeeIds/canViewEmployee.
 */
router.post("/", authenticate, async (req, res) => {
    try {
        const currentUser = req.user;
        let { employeeId, type, startDate, endDate, reason } = req.body;
        // Basic validation
        if (!type || !startDate || !endDate) {
            return res.status(400).json({ success: false, error: "Missing required fields" });
        }
        // Ensure startDate <= endDate
        if (new Date(startDate) > new Date(endDate)) {
            return res.status(400).json({ success: false, error: "Start date cannot be after end date" });
        }
        // --- Permissions check (inline to allow HR to request for others) ---
        const employeeDbIdOfRequester = currentUser?.id;
        if (!employeeDbIdOfRequester) {
            return res.status(401).json({ success: false, error: "Authentication required" });
        }
        // Load role permissions
        const roles = await query(`SELECT r.permissions 
       FROM employee_roles er 
       JOIN roles r ON er.roleId = r.id 
       WHERE er.employeeId = ?`, [employeeDbIdOfRequester]);
        // Load individual permissions (if any)
        const individualPermRows = await query(`SELECT permissions FROM employee_permissions WHERE employeeId = ?`, [employeeDbIdOfRequester]);
        const individualPerms = individualPermRows && individualPermRows.length > 0
            ? (typeof individualPermRows[0].permissions === 'string'
                ? JSON.parse(individualPermRows[0].permissions)
                : individualPermRows[0].permissions)
            : null;
        const has = (module, action) => {
            if (individualPerms && individualPerms[module] && individualPerms[module].includes(action))
                return true;
            for (const r of roles) {
                const perms = typeof r.permissions === 'string' ? JSON.parse(r.permissions) : r.permissions;
                if (perms && perms[module] && perms[module].includes(action))
                    return true;
            }
            return false;
        };
        const canCreate = has("leave", "create");
        const canApprove = has("leave", "approve"); // HR/Admin typically have approve
        if (!canCreate && !canApprove) {
            return res.status(403).json({ success: false, error: "Insufficient permissions to create leave" });
        }
        // Determine target employee for the request
        // - Approvers (HR/Admin) may create for others freely
        // - Creators without approve (e.g., Department Leads) may create for employees within their accessible list
        // - Others can only create for themselves
        if (canApprove) {
            if (!employeeId) {
                employeeId = employeeDbIdOfRequester;
            }
        }
        else if (canCreate) {
            // Check accessible employees (department-scoped for Department Leads)
            const accessibleEmployeeIds = await getAccessibleEmployeeIds(employeeDbIdOfRequester);
            if (employeeId) {
                // If provided a human employee code, we'll normalize later. For now, compare only if it's a UUID.
                const targetIdStr = Array.isArray(employeeId) ? employeeId[0] : employeeId;
                // If user has restricted access (non-null), enforce the target is within scope
                if (accessibleEmployeeIds !== null) {
                    // If target looks like a UUID, we can validate immediately. If not, allow and validation will occur after normalization.
                    if (typeof targetIdStr === 'string' && targetIdStr.includes('-')) {
                        if (!accessibleEmployeeIds.includes(targetIdStr)) {
                            return res.status(403).json({
                                success: false,
                                error: "Access denied. You can only create leave for employees in your department.",
                            });
                        }
                    }
                }
            }
            else {
                // default to self
                employeeId = employeeDbIdOfRequester;
            }
        }
        else {
            // No permission to create on behalf; restrict to self
            employeeId = employeeDbIdOfRequester;
        }
        // Calculate days requested (business days only, excluding weekends)
        const start = new Date(startDate);
        const end = new Date(endDate);
        let days = 0;
        const currentDate = new Date(start);
        while (currentDate <= end) {
            const dayOfWeek = currentDate.getDay();
            if (dayOfWeek !== 0 && dayOfWeek !== 6) { // Not Sunday or Saturday
                days++;
            }
            currentDate.setDate(currentDate.getDate() + 1);
        }
        const hoursPerDay = 8; // Default: 1 day = 8 hours
        const daysRequested = days;
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        // Normalize employeeId to database UUID before insert to avoid FK issues
        let employeeDbId = employeeId;
        if (employeeDbId && !employeeDbId.includes('-')) {
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeDbId]);
            if (!employees || employees.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            employeeDbId = employees[0].id;
        }
        // If requester is not approver, ensure department-scoped access to the target employee (defense-in-depth)
        if (!canApprove && employeeDbId !== employeeDbIdOfRequester) {
            const accessibleEmployeeIds = await getAccessibleEmployeeIds(employeeDbIdOfRequester);
            if (accessibleEmployeeIds === null) {
                // Full access (admins/managers) would have canApprove; keep for safety
            }
            else if (!accessibleEmployeeIds.includes(employeeDbId)) {
                return res.status(403).json({
                    success: false,
                    error: "Access denied. You can only request leave for employees in your department.",
                });
            }
        }
        // Validate employee exists (if a UUID or converted)
        const employeeCheckForInsert = await query(`SELECT id FROM employees WHERE id = ?`, [employeeDbId]);
        if (!employeeCheckForInsert || employeeCheckForInsert.length === 0) {
            return res.status(404).json({ success: false, error: "Employee not found" });
        }
        // If requester is approver (HR/Admin), optionally ensure they have visibility of the employee (for future), but HR/Admin can access all per policies
        // Department-based access for leads can be enforced using canViewEmployee if needed later.
        const requestId = uuid();
        await query(`INSERT INTO leave_requests (id, employeeId, type, startDate, endDate, daysRequested, reason, status, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, 'pending', NOW(), NOW())`, [requestId, employeeDbId, type, startDate, endDate, daysRequested, reason || null]);
        // Update PTO balance pending hours (for PTO and Sick Leave types)
        if (type === 'PTO' || type === 'Sick Leave') {
            // Validate employee exists
            const employeeCheck = await query(`SELECT id FROM employees WHERE id = ?`, [employeeDbId]);
            if (employeeCheck.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            const currentYear = new Date().getFullYear();
            const pendingHours = daysRequested * hoursPerDay;
            // Get or create PTO balance
            let balance = await query(`SELECT id, pendingHours FROM pto_balances WHERE employeeId = ? AND year = ?`, [employeeDbId, currentYear]);
            if (balance.length === 0) {
                const balanceId = uuid();
                await query(`INSERT INTO pto_balances 
           (id, employeeId, year, totalPtoBalance, rolloverHours, pendingHours, remainingBalance, createdAt, updatedAt)
           VALUES (?, ?, ?, 0, 0, ?, 0, NOW(), NOW())`, [balanceId, employeeDbId, currentYear, pendingHours]);
            }
            else {
                await query(`UPDATE pto_balances 
           SET pendingHours = pendingHours + ?, updatedAt = NOW()
           WHERE id = ?`, [pendingHours, balance[0].id]);
            }
        }
        res.json({ success: true, data: { id: requestId, daysRequested } });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/leave/:id/approve
 * Approve leave request
 * - Department Leads can only approve leave requests from employees in their department
 * - Admins/HR/Managers can approve any leave request
 */
router.put("/:id/approve", authenticate, requirePermission("leave:approve"), async (req, res) => {
    try {
        const user = req.user;
        const { id } = req.params;
        const { approvedBy, managerComments } = req.body;
        // Get leave request details
        const leaveRequest = await query(`SELECT * FROM leave_requests WHERE id = ?`, [id]);
        if (leaveRequest.length === 0) {
            return res.status(404).json({ success: false, error: "Leave request not found" });
        }
        const request = leaveRequest[0];
        // Normalize target employee id from request (supports legacy string employeeId)
        let targetEmployeeDbId = request.employeeId;
        if (targetEmployeeDbId && !targetEmployeeDbId.includes('-')) {
            const empRows = await query(`SELECT id FROM employees WHERE employeeId = ?`, [targetEmployeeDbId]);
            if (!empRows || empRows.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found for this leave request" });
            }
            targetEmployeeDbId = empRows[0].id;
        }
        // Only pending requests can be approved
        if (request.status && request.status !== 'pending') {
            return res.status(400).json({ success: false, error: `Cannot approve a ${request.status} request` });
        }
        // Check if user has access to approve this leave request (department-based access)
        const canAccess = await canViewEmployee(user.id, targetEmployeeDbId);
        if (!canAccess) {
            return res.status(403).json({
                success: false,
                error: "Access denied. You can only approve leave requests for employees in your department."
            });
        }
        const hoursPerDay = 8;
        const approvedHours = (request.daysRequested || 0) * hoursPerDay;
        await transaction(async (connection) => {
            // Update leave request
            await connection.execute(`UPDATE leave_requests 
         SET status = 'approved', approvedBy = ?, approvedAt = NOW(), 
             managerComments = ?, updatedAt = NOW()
         WHERE id = ?`, [approvedBy || user.id, managerComments || null, id]);
            // Update PTO balance (for PTO and Sick Leave - merged into PTO)
            if (request.type === 'PTO' || request.type === 'Sick Leave') {
                const currentYear = new Date().getFullYear();
                // Get PTO balance
                const [balance] = await connection.execute(`SELECT id, pendingHours, approvedHours, usedHours, totalPtoBalance, rolloverHours
           FROM pto_balances WHERE employeeId = ? AND year = ?`, [targetEmployeeDbId, currentYear]);
                if (Array.isArray(balance) && balance.length > 0) {
                    const bal = balance[0];
                    const newPendingHours = Math.max(0, (bal.pendingHours || 0) - approvedHours);
                    const newApprovedHours = (bal.approvedHours || 0) + approvedHours;
                    const newUsedHours = (bal.usedHours || 0) + approvedHours;
                    const newRemaining = (bal.totalPtoBalance || 0) + (bal.rolloverHours || 0) - newUsedHours;
                    await connection.execute(`UPDATE pto_balances 
             SET pendingHours = ?, approvedHours = ?, usedHours = ?, 
                 remainingBalance = ?, updatedAt = NOW()
             WHERE id = ?`, [newPendingHours, newApprovedHours, newUsedHours, newRemaining, bal.id]);
                }
            }
        });
        // Notify employee
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        const notificationId = uuid();
        await query(`INSERT INTO notifications (id, employeeId, type, title, message, link, createdAt)
       VALUES (?, ?, 'leave_approved', ?, ?, ?, NOW())`, [
            notificationId,
            targetEmployeeDbId,
            "Leave Request Approved",
            `Your leave request from ${new Date(request.startDate).toLocaleDateString()} to ${new Date(request.endDate).toLocaleDateString()} has been approved.`,
            `/leave-management`,
        ]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/leave/:id/reject
 * Reject leave request
 * - Department Leads can only reject leave requests from employees in their department
 * - Admins/HR/Managers can reject any leave request
 */
router.put("/:id/reject", authenticate, requirePermission("leave:reject"), async (req, res) => {
    try {
        const user = req.user;
        const { id } = req.params;
        const { approvedBy, rejectionReason, managerComments } = req.body;
        // Get leave request details
        const leaveRequest = await query(`SELECT * FROM leave_requests WHERE id = ?`, [id]);
        if (leaveRequest.length === 0) {
            return res.status(404).json({ success: false, error: "Leave request not found" });
        }
        const request = leaveRequest[0];
        // Normalize target employee id from request (supports legacy string employeeId)
        let targetEmployeeDbId = request.employeeId;
        if (targetEmployeeDbId && !targetEmployeeDbId.includes('-')) {
            const empRows = await query(`SELECT id FROM employees WHERE employeeId = ?`, [targetEmployeeDbId]);
            if (!empRows || empRows.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found for this leave request" });
            }
            targetEmployeeDbId = empRows[0].id;
        }
        // Only pending requests can be rejected
        if (request.status && request.status !== 'pending') {
            return res.status(400).json({ success: false, error: `Cannot reject a ${request.status} request` });
        }
        // Check if user has access to reject this leave request (department-based access)
        const canAccess = await canViewEmployee(user.id, targetEmployeeDbId);
        if (!canAccess) {
            return res.status(403).json({
                success: false,
                error: "Access denied. You can only reject leave requests for employees in your department."
            });
        }
        const hoursPerDay = 8;
        const rejectedHours = (request.daysRequested || 0) * hoursPerDay;
        await transaction(async (connection) => {
            // Update leave request
            await connection.execute(`UPDATE leave_requests 
         SET status = 'rejected', approvedBy = ?, rejectionReason = ?, 
             managerComments = ?, updatedAt = NOW()
         WHERE id = ?`, [approvedBy || user.id, rejectionReason || null, managerComments || null, id]);
            // Remove pending hours from PTO balance (for PTO and Sick Leave)
            if (request.type === 'PTO' || request.type === 'Sick Leave') {
                const currentYear = new Date().getFullYear();
                const [balance] = await connection.execute(`SELECT id, pendingHours FROM pto_balances WHERE employeeId = ? AND year = ?`, [targetEmployeeDbId, currentYear]);
                if (Array.isArray(balance) && balance.length > 0) {
                    const bal = balance[0];
                    const newPendingHours = Math.max(0, (bal.pendingHours || 0) - rejectedHours);
                    await connection.execute(`UPDATE pto_balances 
             SET pendingHours = ?, updatedAt = NOW()
             WHERE id = ?`, [newPendingHours, bal.id]);
                }
            }
        });
        // Notify employee
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        const notificationId = uuid();
        await query(`INSERT INTO notifications (id, employeeId, type, title, message, link, createdAt)
       VALUES (?, ?, 'leave_rejected', ?, ?, ?, NOW())`, [
            notificationId,
            targetEmployeeDbId,
            "Leave Request Rejected",
            `Your leave request from ${new Date(request.startDate).toLocaleDateString()} to ${new Date(request.endDate).toLocaleDateString()} was rejected. Reason: ${rejectionReason || 'Not specified'}`,
            `/leave-management`,
        ]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=leave.js.map