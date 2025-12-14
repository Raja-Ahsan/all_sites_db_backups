import express from "express";
import { query } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
import { requirePermission } from "../middleware/rbac.js";
import { getAccessibleEmployeeIds } from "../middleware/departmentAccess.js";
const router = express.Router();
/**
 * Middleware to check if clock-in is allowed from this IP/device
 * Allows portal access for individual employees while still logging device info
 */
const checkClockInDevice = async (req, res, next) => {
    try {
        const ipAddress = req.ip || req.headers['x-forwarded-for'] || req.connection.remoteAddress;
        const deviceId = req.headers['x-device-id'];
        const userAgent = req.headers['user-agent'] || '';
        // Check if this is a portal request (web browser) vs physical device
        const isPortalRequest = userAgent.includes('Mozilla') || userAgent.includes('Chrome') || userAgent.includes('Firefox') || userAgent.includes('Safari');
        // For portal requests, allow individual employees to clock in/out
        // For physical devices, check whitelist
        if (!isPortalRequest) {
            const deviceCheck = await query(`SELECT id FROM clock_in_devices 
         WHERE isActive = 1 
         AND (ipAddress = ? OR deviceId = ?)`, [ipAddress, deviceId || '']);
            if (deviceCheck.length === 0 && process.env.NODE_ENV === 'production') {
                return res.status(403).json({
                    success: false,
                    error: "Clock-in is only allowed from designated devices. Please contact IT to register your device."
                });
            }
        }
        // Store device info for logging
        req.clockInDevice = {
            ipAddress: Array.isArray(ipAddress) ? ipAddress[0] : ipAddress,
            deviceId: deviceId || (isPortalRequest ? 'portal' : null),
            isPortalRequest,
        };
        next();
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};
/**
 * POST /api/attendance/clock-in
 * Clock in for an employee
 */
router.post("/clock-in", authenticate, checkClockInDevice, async (req, res) => {
    try {
        let { employeeId, shiftAssignmentId, notes } = req.body;
        const deviceInfo = req.clockInDevice;
        const currentUser = req.user;
        // If employeeId not provided, use current user's ID
        if (!employeeId) {
            employeeId = currentUser.id;
        }
        // Security: Employees can only clock themselves in
        if (employeeId !== currentUser.id) {
            const roleNames = currentUser?.roles || [];
            const isAdmin = roleNames.includes("Admin");
            const isHR = roleNames.includes("HR");
            // Only Admin/HR can clock in other employees
            if (!isAdmin && !isHR) {
                return res.status(403).json({
                    success: false,
                    error: "You can only clock yourself in. Please use your own employee ID."
                });
            }
        }
        // Convert string employee ID (like "EMP001") to database UUID if needed
        if (employeeId && !employeeId.includes('-')) {
            // It's a string employee ID, need to get the database UUID
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeId]);
            if (employees.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            employeeId = employees[0].id;
        }
        // Validate employee exists
        const employeeCheck = await query(`SELECT id FROM employees WHERE id = ?`, [employeeId]);
        if (employeeCheck.length === 0) {
            return res.status(404).json({ success: false, error: "Employee not found" });
        }
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        const attendanceId = uuid();
        const clockInTime = new Date();
        // Check if there's an open attendance log (clocked in but not out)
        const openLog = await query(`SELECT id FROM attendance_logs 
       WHERE employeeId = ? AND clockOut IS NULL 
       ORDER BY clockIn DESC LIMIT 1`, [employeeId]);
        if (openLog.length > 0) {
            return res.status(400).json({
                success: false,
                error: "You are already clocked in. Please clock out first."
            });
        }
        // Check if late (if shift assignment exists)
        let isLate = false;
        if (shiftAssignmentId) {
            const shift = await query(`SELECT s.startTime 
         FROM shifts s
         JOIN shift_assignments sa ON s.id = sa.shiftId
         WHERE sa.id = ?`, [shiftAssignmentId]);
            if (shift.length > 0 && new Date(shift[0].startTime) < clockInTime) {
                isLate = true;
            }
            // Update shift assignment clock-in
            await query(`UPDATE shift_assignments 
         SET clockIn = ?, status = 'confirmed', updatedAt = NOW()
         WHERE id = ?`, [clockInTime, shiftAssignmentId]);
        }
        // Create attendance log
        await query(`INSERT INTO attendance_logs 
       (id, employeeId, shiftAssignmentId, clockIn, ipAddress, deviceInfo, isLate, notes, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())`, [
            attendanceId,
            employeeId,
            shiftAssignmentId || null,
            clockInTime,
            deviceInfo.ipAddress,
            deviceInfo.deviceId || null,
            isLate ? 1 : 0,
            notes || null,
        ]);
        res.json({
            success: true,
            data: {
                id: attendanceId,
                clockIn: clockInTime,
                isLate
            }
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/attendance/manual
 * Manually add a missing clock-in (and optional clock-out)
 * Permissions:
 *  - Admin/HR: any employee
 *  - Department Lead: only employees in their department
 */
router.post("/manual", authenticate, requirePermission("attendance:update"), async (req, res) => {
    try {
        let { employeeId, clockIn, clockOut, notes, shiftAssignmentId } = req.body;
        const currentUser = req.user;
        if (!employeeId || !clockIn) {
            return res.status(400).json({ success: false, error: "employeeId and clockIn are required" });
        }
        // Normalize employeeId: if provided as human-readable employeeId, convert to UUID
        if (employeeId && typeof employeeId === 'string' && !employeeId.includes('-')) {
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeId]);
            if (employees.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            employeeId = employees[0].id;
        }
        // Access control: Department-based
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        if (accessibleEmployeeIds !== null) {
            if (!accessibleEmployeeIds.includes(String(employeeId))) {
                return res.status(403).json({ success: false, error: "Access denied. You can only add attendance for employees in your department." });
            }
        }
        // Parse and validate times
        const clockInTime = new Date(clockIn);
        if (isNaN(clockInTime.getTime())) {
            return res.status(400).json({ success: false, error: "Invalid clockIn datetime" });
        }
        let clockOutTime = null;
        if (clockOut) {
            clockOutTime = new Date(clockOut);
            if (isNaN(clockOutTime.getTime())) {
                return res.status(400).json({ success: false, error: "Invalid clockOut datetime" });
            }
            if (clockOutTime <= clockInTime) {
                return res.status(400).json({ success: false, error: "clockOut must be after clockIn" });
            }
        }
        // Check for overlapping attendance logs
        const overlaps = await query(`SELECT id, clockIn, clockOut FROM attendance_logs 
       WHERE employeeId = ?
         AND (
           (clockOut IS NULL AND clockIn <= ?) OR
           (clockOut IS NOT NULL AND ? < clockOut AND ? > clockIn)
         )`, [employeeId, clockOutTime ? clockOutTime : clockInTime, clockOutTime ? clockOutTime : clockInTime, clockInTime]);
        if (overlaps.length > 0) {
            return res.status(400).json({ success: false, error: "New entry overlaps existing attendance. Please review existing logs." });
        }
        const uuid = () => 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            const r = Math.random() * 16 | 0;
            const v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
        const attendanceId = uuid();
        // Compute total hours if clockOut provided
        let totalHours = null;
        if (clockOutTime) {
            const diffMs = clockOutTime.getTime() - clockInTime.getTime();
            totalHours = Math.round((diffMs / (1000 * 60 * 60)) * 100) / 100;
        }
        // Optional late flag if linked to shiftAssignment
        let isLate = 0;
        if (shiftAssignmentId) {
            const shift = await query(`SELECT s.startTime FROM shifts s JOIN shift_assignments sa ON s.id = sa.shiftId WHERE sa.id = ?`, [shiftAssignmentId]);
            if (shift.length > 0) {
                isLate = new Date(shift[0].startTime) < clockInTime ? 1 : 0;
            }
        }
        // Insert attendance log
        await query(`INSERT INTO attendance_logs (id, employeeId, shiftAssignmentId, clockIn, clockOut, ipAddress, deviceInfo, isLate, isNoShow, totalHours, notes, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 0, ?, ?, NOW(), NOW())`, [attendanceId, employeeId, shiftAssignmentId || null, clockInTime, clockOutTime, null, 'manual', isLate, totalHours, notes || null]);
        // Update shift assignment clocks if provided
        if (shiftAssignmentId) {
            await query(`UPDATE shift_assignments SET clockIn = COALESCE(clockIn, ?), clockOut = COALESCE(clockOut, ?), updatedAt = NOW() WHERE id = ?`, [clockInTime, clockOutTime, shiftAssignmentId]);
        }
        return res.json({ success: true, data: { id: attendanceId } });
    }
    catch (error) {
        return res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/attendance/flag
 * Flag an attendance log for HR review (creates notifications for HR roles)
 */
router.post("/flag", authenticate, requirePermission("attendance:update"), async (req, res) => {
    try {
        const { logId, reason } = req.body;
        const currentUser = req.user;
        if (!logId) {
            return res.status(400).json({ success: false, error: "logId is required" });
        }
        // Load log and employee info
        const logs = await query(`SELECT al.id, al.employeeId, al.clockIn, al.clockOut, e.firstName, e.lastName, e.employeeId as empCode
       FROM attendance_logs al
       JOIN employees e ON al.employeeId = e.id
       WHERE al.id = ?`, [logId]);
        if (logs.length === 0) {
            return res.status(404).json({ success: false, error: "Attendance log not found" });
        }
        const log = logs[0];
        // Department-based access: ensure current user can access this employee
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        if (accessibleEmployeeIds !== null && !accessibleEmployeeIds.includes(String(log.employeeId))) {
            return res.status(403).json({ success: false, error: "Access denied. You can only flag logs for employees in your department." });
        }
        // Prepare notification recipients (HR and HR Admin)
        const recipients = await query(`SELECT DISTINCT e.id
       FROM employees e
       JOIN employee_roles er ON e.id = er.employeeId
       JOIN roles r ON er.roleId = r.id
       WHERE r.name IN ('HR', 'HR Admin') AND e.isActive = 1`);
        if (recipients.length === 0) {
            return res.json({ success: true, data: { notified: 0 } });
        }
        const uuid = () => 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            const r = Math.random() * 16 | 0;
            const v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
        const title = `Attendance Entry Flagged for ${log.firstName} ${log.lastName}`;
        const whenStr = new Date(log.clockIn).toLocaleString();
        const msg = `A department lead flagged an attendance entry for ${log.firstName} ${log.lastName} (${log.empCode}) on ${whenStr}. Reason: ${reason || 'N/A'}`;
        const link = `/attendance?logId=${log.id}`;
        for (const r of recipients) {
            await query(`INSERT INTO notifications (id, employeeId, type, title, message, isRead, readAt, link, metadata, createdAt)
         VALUES (?, ?, 'attendance_flag', ?, ?, 0, NULL, ?, NULL, NOW())`, [uuid(), r.id, title, msg, link]);
        }
        return res.json({ success: true, data: { notified: recipients.length } });
    }
    catch (error) {
        return res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/attendance/clock-out
 * Clock out for an employee
 */
router.post("/clock-out", authenticate, checkClockInDevice, async (req, res) => {
    try {
        let { employeeId, notes } = req.body;
        const deviceInfo = req.clockInDevice;
        const currentUser = req.user;
        // If employeeId not provided, use current user's ID
        if (!employeeId) {
            employeeId = currentUser.id;
        }
        // Security: Employees can only clock themselves out
        if (employeeId !== currentUser.id) {
            const roleNames = currentUser?.roles || [];
            const isAdmin = roleNames.includes("Admin");
            const isHR = roleNames.includes("HR");
            // Only Admin/HR can clock out other employees
            if (!isAdmin && !isHR) {
                return res.status(403).json({
                    success: false,
                    error: "You can only clock yourself out. Please use your own employee ID."
                });
            }
        }
        // Convert string employee ID (like "EMP001") to database UUID if needed
        if (employeeId && !employeeId.includes('-')) {
            // It's a string employee ID, need to get the database UUID
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeId]);
            if (employees.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            employeeId = employees[0].id;
        }
        // Validate employee exists
        const employeeCheck = await query(`SELECT id FROM employees WHERE id = ?`, [employeeId]);
        if (employeeCheck.length === 0) {
            return res.status(404).json({ success: false, error: "Employee not found" });
        }
        // Find the most recent open attendance log
        const openLog = await query(`SELECT id, clockIn, shiftAssignmentId 
       FROM attendance_logs 
       WHERE employeeId = ? AND clockOut IS NULL 
       ORDER BY clockIn DESC LIMIT 1`, [employeeId]);
        if (openLog.length === 0) {
            return res.status(400).json({
                success: false,
                error: "No active clock-in found. Please clock in first."
            });
        }
        const log = openLog[0];
        const clockOutTime = new Date();
        const clockInTime = new Date(log.clockIn);
        // Calculate total hours
        const totalHours = (clockOutTime.getTime() - clockInTime.getTime()) / (1000 * 60 * 60);
        // Update attendance log
        await query(`UPDATE attendance_logs 
       SET clockOut = ?, totalHours = ?, notes = COALESCE(CONCAT(notes, '\n', ?), notes), updatedAt = NOW()
       WHERE id = ?`, [clockOutTime, totalHours, notes || null, log.id]);
        // Update shift assignment if exists
        if (log.shiftAssignmentId) {
            await query(`UPDATE shift_assignments 
         SET clockOut = ?, updatedAt = NOW()
         WHERE id = ?`, [clockOutTime, log.shiftAssignmentId]);
        }
        res.json({
            success: true,
            data: {
                clockOut: clockOutTime,
                totalHours: totalHours.toFixed(2)
            }
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/attendance/logs
 * Get attendance logs with filters
 */
router.get("/logs", authenticate, requirePermission("attendance:read"), async (req, res) => {
    try {
        let { employeeId, startDate, endDate, departmentId } = req.query;
        const currentUser = req.user;
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        // Convert string employee ID to database UUID if needed
        if (employeeId && typeof employeeId === 'string' && !employeeId.includes('-')) {
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeId]);
            if (employees.length > 0) {
                employeeId = employees[0].id;
            }
        }
        let sql = `
      SELECT 
        al.*,
        e.firstName,
        e.lastName,
        e.employeeId,
        d.name as departmentName
      FROM attendance_logs al
      JOIN employees e ON al.employeeId = e.id
      LEFT JOIN departments d ON e.departmentId = d.id
      WHERE 1=1
    `;
        const params = [];
        // Enforce department-based access: if user is restricted, filter to allowed employees
        if (accessibleEmployeeIds !== null) {
            if (employeeId && typeof employeeId === 'string') {
                if (!accessibleEmployeeIds.includes(employeeId)) {
                    return res.status(403).json({ success: false, error: "Access denied to requested employee's attendance." });
                }
            }
            if (accessibleEmployeeIds.length === 0) {
                return res.json({ success: true, data: [] });
            }
            const placeholders = accessibleEmployeeIds.map(() => '?').join(',');
            sql += ` AND al.employeeId IN (${placeholders})`;
            params.push(...accessibleEmployeeIds);
        }
        if (employeeId) {
            sql += " AND al.employeeId = ?";
            params.push(employeeId);
        }
        if (startDate) {
            sql += " AND DATE(al.clockIn) >= ?";
            params.push(startDate);
        }
        if (endDate) {
            sql += " AND DATE(al.clockIn) <= ?";
            params.push(endDate);
        }
        if (departmentId) {
            sql += " AND e.departmentId = ?";
            params.push(departmentId);
        }
        sql += " ORDER BY al.clockIn DESC LIMIT 100";
        const logs = await query(sql, params);
        res.json({ success: true, data: logs });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/attendance/manager-review
 * Get manager review data (late employees, no-shows, hours, weekly summaries)
 */
router.get("/manager-review", authenticate, requirePermission("attendance:read"), async (req, res) => {
    try {
        const { departmentId, startDate, endDate } = req.query;
        const currentUser = req.user;
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        // Default to current week if no dates provided
        const start = startDate || new Date(new Date().setDate(new Date().getDate() - new Date().getDay())).toISOString().split('T')[0];
        const end = endDate || new Date(new Date().setDate(new Date().getDate() - new Date().getDay() + 6)).toISOString().split('T')[0];
        let whereClause = "WHERE DATE(al.clockIn) BETWEEN ? AND ?";
        const paramsBase = [start, end];
        if (departmentId) {
            whereClause += " AND e.departmentId = ?";
            paramsBase.push(departmentId);
        }
        // Build employee access filters (for attendance_logs alias al and shift_assignments alias sa)
        let employeeFilterAl = "";
        let employeeFilterSa = "";
        const employeeFilterParams = [];
        const employeeFilterParamsSa = [];
        if (accessibleEmployeeIds !== null) {
            if (accessibleEmployeeIds.length === 0) {
                return res.json({ success: true, data: { lateEmployees: [], noShows: [], totalHours: [], weeklySummary: [], period: { start, end } } });
            }
            const ph = accessibleEmployeeIds.map(() => '?').join(',');
            employeeFilterAl = ` AND al.employeeId IN (${ph})`;
            employeeFilterSa = ` AND sa.employeeId IN (${ph})`;
            employeeFilterParams.push(...accessibleEmployeeIds);
            employeeFilterParamsSa.push(...accessibleEmployeeIds);
        }
        // Late employees
        const lateEmployees = await query(`SELECT 
        al.employeeId,
        e.firstName,
        e.lastName,
        e.employeeId as empId,
        d.name as departmentName,
        COUNT(*) as lateCount,
        MIN(al.clockIn) as firstLateClockIn
       FROM attendance_logs al
       JOIN employees e ON al.employeeId = e.id
       LEFT JOIN departments d ON e.departmentId = d.id
       ${whereClause}
       AND al.isLate = 1
       ${employeeFilterAl}
       GROUP BY al.employeeId, e.firstName, e.lastName, e.employeeId, d.name
       ORDER BY lateCount DESC`, [...paramsBase, ...employeeFilterParams]);
        // No-call/no-show (scheduled but no clock-in)
        const noShows = await query(`SELECT 
        sa.employeeId,
        e.firstName,
        e.lastName,
        e.employeeId as empId,
        d.name as departmentName,
        s.date,
        s.startTime,
        COUNT(*) as noShowCount
       FROM shift_assignments sa
       JOIN shifts s ON sa.shiftId = s.id
       JOIN employees e ON sa.employeeId = e.id
       LEFT JOIN departments d ON e.departmentId = d.id
       WHERE DATE(s.date) BETWEEN ? AND ?
         AND sa.status = 'scheduled'
         AND sa.clockIn IS NULL
         AND s.date < NOW()
         ${departmentId ? 'AND e.departmentId = ?' : ''}
         ${employeeFilterSa}
       GROUP BY sa.employeeId, e.firstName, e.lastName, e.employeeId, d.name, s.date, s.startTime
       ORDER BY s.date DESC`, departmentId ? [start, end, departmentId, ...employeeFilterParamsSa] : [start, end, ...employeeFilterParamsSa]);
        // Total hours per employee
        const totalHours = await query(`SELECT 
        al.employeeId,
        e.firstName,
        e.lastName,
        e.employeeId as empId,
        d.name as departmentName,
        SUM(al.totalHours) as totalHours,
        COUNT(*) as attendanceCount
       FROM attendance_logs al
       JOIN employees e ON al.employeeId = e.id
       LEFT JOIN departments d ON e.departmentId = d.id
       ${whereClause}
       AND al.clockOut IS NOT NULL
       ${employeeFilterAl}
       GROUP BY al.employeeId, e.firstName, e.lastName, e.employeeId, d.name
       ORDER BY totalHours DESC`, [...paramsBase, ...employeeFilterParams]);
        // Weekly summary
        const weeklySummary = await query(`SELECT 
        DATE(al.clockIn) as date,
        COUNT(DISTINCT al.employeeId) as employeesPresent,
        COUNT(*) as totalClockIns,
        SUM(al.totalHours) as totalHours,
        SUM(CASE WHEN al.isLate = 1 THEN 1 ELSE 0 END) as lateCount
       FROM attendance_logs al
       JOIN employees e ON al.employeeId = e.id
       ${whereClause}
       ${employeeFilterAl}
       GROUP BY DATE(al.clockIn)
       ORDER BY date ASC`, [...paramsBase, ...employeeFilterParams]);
        res.json({
            success: true,
            data: {
                lateEmployees,
                noShows,
                totalHours,
                weeklySummary,
                period: { start, end },
            },
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/attendance/current-status
 * Get current clock-in status for an employee
 */
router.get("/current-status/:employeeId", authenticate, requirePermission("attendance:read"), async (req, res) => {
    try {
        let { employeeId } = req.params;
        // Convert string employee ID to database UUID if needed
        if (employeeId && !employeeId.includes('-')) {
            const employees = await query(`SELECT id FROM employees WHERE employeeId = ?`, [employeeId]);
            if (employees.length === 0) {
                return res.status(404).json({ success: false, error: "Employee not found" });
            }
            employeeId = employees[0].id;
        }
        const currentLog = await query(`SELECT * FROM attendance_logs 
       WHERE employeeId = ? AND clockOut IS NULL 
       ORDER BY clockIn DESC LIMIT 1`, [employeeId]);
        if (currentLog.length === 0) {
            return res.json({ success: true, data: { isClockedIn: false } });
        }
        res.json({
            success: true,
            data: {
                isClockedIn: true,
                attendanceLog: currentLog[0],
            },
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=attendance.js.map