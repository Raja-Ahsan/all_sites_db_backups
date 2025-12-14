import express from "express";
import { query, transaction } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
import { requirePermission } from "../middleware/rbac.js";
import { getAccessibleEmployeeIds, getUserDepartmentInfo } from "../middleware/departmentAccess.js";
const router = express.Router();
/**
 * GET /api/scheduling/shifts
 * Get shifts with assignments (filtered by department access)
 * - Employees: Can only see their own assigned shifts
 * - Department Leads: Can see shifts for their department
 * - Admins/HR/Managers: Can see all shifts
 */
router.get("/shifts", authenticate, requirePermission("scheduling:read"), async (req, res) => {
    try {
        const { startDate, endDate, employeeId, departmentId } = req.query;
        const currentUser = req.user;
        // Get accessible employee IDs based on user's role and department
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        let sql = `
      SELECT 
        s.*,
        d.name as departmentName,
        GROUP_CONCAT(
          CONCAT(e.firstName, ' ', e.lastName, ' (', e.employeeId, ')') 
          SEPARATOR ', '
        ) as assignedEmployees,
        COUNT(sa.id) as assignmentCount
      FROM shifts s
      LEFT JOIN departments d ON s.departmentId = d.id
      LEFT JOIN shift_assignments sa ON s.id = sa.shiftId
      LEFT JOIN employees e ON sa.employeeId = e.id
    `;
        const params = [];
        const conditions = [];
        // Date filtering
        if (startDate && endDate) {
            conditions.push(`s.date BETWEEN ? AND ?`);
            params.push(startDate, endDate);
        }
        // Apply department-based filtering for shifts
        if (userInfo?.isDepartmentLead && userInfo.departmentId) {
            // Department leads can see all shifts in their department, including unassigned
            // If departmentId filter provided, enforce it matches the lead's department
            if (departmentId && departmentId !== userInfo.departmentId) {
                return res.status(403).json({
                    success: false,
                    error: "Access denied. Department Leads can only view their own department's schedule.",
                });
            }
            conditions.push(`s.departmentId = ?`);
            params.push(userInfo.departmentId);
        }
        else if (accessibleEmployeeIds !== null) {
            // null means user can view all (Admin/HR/Manager)
            if (accessibleEmployeeIds.length === 0) {
                // No access - return empty array
                return res.json({ success: true, data: [] });
            }
            // Filter shifts that are assigned to accessible employees
            const placeholders = accessibleEmployeeIds.map(() => '?').join(',');
            conditions.push(`sa.employeeId IN (${placeholders})`);
            params.push(...accessibleEmployeeIds);
        }
        // Additional filters
        if (employeeId) {
            // Ensure employeeId is a string
            const employeeIdStr = Array.isArray(employeeId) ? employeeId[0] : employeeId;
            const employeeIdString = typeof employeeIdStr === 'string' ? employeeIdStr : String(employeeIdStr);
            // Check if user has access to this employee
            if (accessibleEmployeeIds !== null && !accessibleEmployeeIds.includes(employeeIdString)) {
                return res.status(403).json({
                    success: false,
                    error: "Access denied. You can only view shifts for employees in your department."
                });
            }
            conditions.push(`sa.employeeId = ?`);
            params.push(employeeIdString);
        }
        if (departmentId) {
            // If not Department Lead scoped above, allow department filter (Admins/HR)
            if (!(userInfo?.isDepartmentLead)) {
                conditions.push(`s.departmentId = ?`);
                params.push(departmentId);
            }
        }
        if (conditions.length > 0) {
            sql += ` WHERE ` + conditions.join(" AND ");
        }
        sql += ` GROUP BY s.id ORDER BY s.date, s.startTime`;
        const shifts = await query(sql, params);
        res.json({ success: true, data: shifts });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/scheduling/conflicts
 * Check for scheduling conflicts
 */
router.get("/conflicts", authenticate, requirePermission("scheduling:read"), async (req, res) => {
    try {
        const { employeeId, startTime, endTime, date, excludeShiftId } = req.query;
        const currentUser = req.user;
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        if (accessibleEmployeeIds !== null) {
            if (!employeeId || !accessibleEmployeeIds.includes(String(employeeId))) {
                return res.status(403).json({ success: false, error: "Access denied to requested employee's scheduling conflicts." });
            }
        }
        const conflicts = await query(`
      SELECT s.*, e.firstName, e.lastName, e.employeeId
      FROM shifts s
      JOIN shift_assignments sa ON s.id = sa.shiftId
      JOIN employees e ON sa.employeeId = e.id
      WHERE sa.employeeId = ?
        AND s.date = ?
        AND s.id != ?
        AND (
          (s.startTime < ? AND s.endTime > ?) OR
          (s.startTime < ? AND s.endTime > ?) OR
          (s.startTime >= ? AND s.endTime <= ?)
        )
    `, [
            employeeId,
            date,
            excludeShiftId || '',
            startTime, startTime,
            endTime, endTime,
            startTime, endTime
        ]);
        res.json({ success: true, data: conflicts, hasConflict: conflicts.length > 0 });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/scheduling/shifts
 * Create a new shift
 */
router.post("/shifts", authenticate, requirePermission("scheduling:create"), async (req, res) => {
    try {
        const { date, startTime, endTime, departmentId, notes, employeeIds } = req.body;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        // Department Lead guard: can only create shifts in their own department and assign their department members
        if (userInfo?.isDepartmentLead) {
            if (!userInfo.departmentId || departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Department Leads can only create shifts for their own department." });
            }
            if (employeeIds && Array.isArray(employeeIds) && accessibleEmployeeIds !== null) {
                const invalid = employeeIds.find((id) => !accessibleEmployeeIds.includes(id));
                if (invalid) {
                    return res.status(403).json({ success: false, error: "One or more selected employees are outside your department." });
                }
            }
        }
        await transaction(async (connection) => {
            const shiftId = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
            await connection.execute(`INSERT INTO shifts (id, date, startTime, endTime, departmentId, notes, createdAt, updatedAt)
         VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())`, [shiftId, date, startTime, endTime, departmentId || null, notes || null]);
            // Assign employees if provided
            if (employeeIds && Array.isArray(employeeIds)) {
                for (const empId of employeeIds) {
                    const assignmentId = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        const r = Math.random() * 16 | 0;
                        const v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                    await connection.execute(`INSERT INTO shift_assignments (id, shiftId, employeeId, status, createdAt, updatedAt)
             VALUES (?, ?, ?, 'scheduled', NOW(), NOW())`, [assignmentId, shiftId, empId]);
                }
            }
            res.json({ success: true, data: { id: shiftId } });
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/scheduling/shifts/:id
 * Get a specific shift with assignments
 */
router.get("/shifts/:id", authenticate, requirePermission("scheduling:read"), async (req, res) => {
    try {
        const { id } = req.params;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        const shifts = await query(`
      SELECT 
        s.*,
        d.name as departmentName,
        GROUP_CONCAT(
          CONCAT(e.firstName, ' ', e.lastName, ' (', e.employeeId, ')') 
          SEPARATOR ', '
        ) as assignedEmployees
      FROM shifts s
      LEFT JOIN departments d ON s.departmentId = d.id
      LEFT JOIN shift_assignments sa ON s.id = sa.shiftId
      LEFT JOIN employees e ON sa.employeeId = e.id
      WHERE s.id = ?
      GROUP BY s.id
    `, [id]);
        if (shifts.length === 0) {
            return res.status(404).json({ success: false, error: "Shift not found" });
        }
        if (userInfo?.isDepartmentLead && userInfo.departmentId && shifts[0].departmentId !== userInfo.departmentId) {
            return res.status(403).json({ success: false, error: "Access denied. You can only view shifts in your department." });
        }
        res.json({ success: true, data: shifts[0] });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/scheduling/shifts/:id/assignments
 * Get shift assignments for a specific shift
 */
router.get("/shifts/:id/assignments", authenticate, requirePermission("scheduling:read"), async (req, res) => {
    try {
        const { id } = req.params;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        if (userInfo?.isDepartmentLead && userInfo.departmentId) {
            const [shift] = await query(`SELECT departmentId FROM shifts WHERE id = ?`, [id]);
            if (!shift) {
                return res.status(404).json({ success: false, error: "Shift not found" });
            }
            if (shift.departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Access denied. You can only view assignments for your department." });
            }
        }
        const assignments = await query(`
      SELECT sa.*, e.firstName, e.lastName, e.employeeId
      FROM shift_assignments sa
      JOIN employees e ON sa.employeeId = e.id
      WHERE sa.shiftId = ?
    `, [id]);
        res.json({ success: true, data: assignments });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/scheduling/shifts/:id
 * Update a shift
 */
router.put("/shifts/:id", authenticate, requirePermission("scheduling:update"), async (req, res) => {
    try {
        const { id } = req.params;
        const { date, startTime, endTime, departmentId, notes, employeeIds } = req.body;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        if (userInfo?.isDepartmentLead) {
            // Load existing shift to verify department
            const [existing] = await query(`SELECT departmentId FROM shifts WHERE id = ?`, [id]);
            if (!existing) {
                return res.status(404).json({ success: false, error: "Shift not found" });
            }
            if (!userInfo.departmentId || existing.departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Department Leads can only edit shifts in their own department." });
            }
            if (departmentId && departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Cannot move shift to another department." });
            }
            if (employeeIds && Array.isArray(employeeIds) && accessibleEmployeeIds !== null) {
                const invalid = employeeIds.find((empId) => !accessibleEmployeeIds.includes(empId));
                if (invalid) {
                    return res.status(403).json({ success: false, error: "One or more selected employees are outside your department." });
                }
            }
        }
        await transaction(async (connection) => {
            // Update shift
            await connection.execute(`UPDATE shifts 
         SET date = ?, startTime = ?, endTime = ?, departmentId = ?, notes = ?, updatedAt = NOW()
         WHERE id = ?`, [date, startTime, endTime, departmentId || null, notes || null, id]);
            // Remove existing assignments
            await connection.execute(`DELETE FROM shift_assignments WHERE shiftId = ?`, [id]);
            // Add new assignments if provided
            if (employeeIds && Array.isArray(employeeIds)) {
                for (const empId of employeeIds) {
                    const assignmentId = 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        const r = Math.random() * 16 | 0;
                        const v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                    await connection.execute(`INSERT INTO shift_assignments (id, shiftId, employeeId, status, createdAt, updatedAt)
             VALUES (?, ?, ?, 'scheduled', NOW(), NOW())`, [assignmentId, id, empId]);
                }
            }
        });
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * DELETE /api/scheduling/shifts/:id
 * Delete a shift
 */
router.delete("/shifts/:id", authenticate, requirePermission("scheduling:delete"), async (req, res) => {
    try {
        const { id } = req.params;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        if (userInfo?.isDepartmentLead && userInfo.departmentId) {
            const [shift] = await query(`SELECT departmentId FROM shifts WHERE id = ?`, [id]);
            if (!shift) {
                return res.status(404).json({ success: false, error: "Shift not found" });
            }
            if (shift.departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Department Leads cannot delete shifts outside their department." });
            }
        }
        await query(`DELETE FROM shifts WHERE id = ?`, [id]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/scheduling/assign
 * Assign employee to shift
 */
router.post("/assign", authenticate, requirePermission("scheduling:update"), async (req, res) => {
    try {
        const { shiftId, employeeId } = req.body;
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        if (userInfo?.isDepartmentLead) {
            const [shift] = await query(`SELECT departmentId FROM shifts WHERE id = ?`, [shiftId]);
            if (!shift) {
                return res.status(404).json({ success: false, error: "Shift not found" });
            }
            if (!userInfo.departmentId || shift.departmentId !== userInfo.departmentId) {
                return res.status(403).json({ success: false, error: "Department Leads can only assign within their department." });
            }
            if (accessibleEmployeeIds !== null && !accessibleEmployeeIds.includes(employeeId)) {
                return res.status(403).json({ success: false, error: "You can only assign employees from your department." });
            }
        }
        await query(`INSERT INTO shift_assignments (id, shiftId, employeeId, status, createdAt, updatedAt)
       VALUES (UUID(), ?, ?, 'scheduled', NOW(), NOW())
       ON DUPLICATE KEY UPDATE status = 'scheduled'`, [shiftId, employeeId]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/scheduling/swap
 * Swap shift assignments between two employees (optionally across two shifts)
 * Body: { shiftAId, employeeAId, shiftBId, employeeBId }
 */
router.post("/swap", authenticate, requirePermission("scheduling:update"), async (req, res) => {
    try {
        const { shiftAId, employeeAId, shiftBId, employeeBId } = req.body;
        if (!shiftAId || !employeeAId || !shiftBId || !employeeBId) {
            return res.status(400).json({ success: false, error: "Missing required fields" });
        }
        const currentUser = req.user;
        const userInfo = await getUserDepartmentInfo(currentUser.id);
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        // Security: Department Leads limited to their department and employees
        const shifts = await query(`SELECT id, departmentId FROM shifts WHERE id IN (?, ?)`, [shiftAId, shiftBId]);
        if (shifts.length !== 2) {
            return res.status(404).json({ success: false, error: "One or both shifts not found" });
        }
        if (userInfo?.isDepartmentLead) {
            if (!userInfo.departmentId || shifts.some((s) => s.departmentId !== userInfo.departmentId)) {
                return res.status(403).json({ success: false, error: "Department Leads can only swap within their department." });
            }
            if (accessibleEmployeeIds !== null && (!accessibleEmployeeIds.includes(employeeAId) || !accessibleEmployeeIds.includes(employeeBId))) {
                return res.status(403).json({ success: false, error: "Both employees must be within your department." });
            }
        }
        // Verify existing assignments
        const assignments = await query(`SELECT shiftId, employeeId FROM shift_assignments WHERE (shiftId = ? AND employeeId = ?) OR (shiftId = ? AND employeeId = ?)`, [shiftAId, employeeAId, shiftBId, employeeBId]);
        if (assignments.length !== 2) {
            return res.status(400).json({ success: false, error: "Assignments to swap not found" });
        }
        await transaction(async (connection) => {
            // Remove current assignments
            await connection.execute(`DELETE FROM shift_assignments WHERE shiftId = ? AND employeeId = ?`, [shiftAId, employeeAId]);
            await connection.execute(`DELETE FROM shift_assignments WHERE shiftId = ? AND employeeId = ?`, [shiftBId, employeeBId]);
            // Insert swapped assignments
            const uuid = () => 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
            await connection.execute(`INSERT INTO shift_assignments (id, shiftId, employeeId, status, createdAt, updatedAt) VALUES (?, ?, ?, 'scheduled', NOW(), NOW())`, [uuid(), shiftAId, employeeBId]);
            await connection.execute(`INSERT INTO shift_assignments (id, shiftId, employeeId, status, createdAt, updatedAt) VALUES (?, ?, ?, 'scheduled', NOW(), NOW())`, [uuid(), shiftBId, employeeAId]);
        });
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=scheduling.js.map