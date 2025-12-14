import express from "express";
import { query } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
import { requirePermission } from "../middleware/rbac.js";
import { getAccessibleEmployeeIds } from "../middleware/departmentAccess.js";
const router = express.Router();
/**
 * GET /api/licenses
 * Get all licenses
 */
router.get("/", authenticate, requirePermission("licenses:read"), async (req, res) => {
    try {
        const { employeeId } = req.query;
        const currentUser = req.user;
        // Determine which employees this user can access (null = can view all)
        const accessibleEmployeeIds = await getAccessibleEmployeeIds(currentUser.id);
        let sql = `
      SELECT 
        l.*,
        e.firstName,
        e.lastName,
        e.employeeId,
        DATEDIFF(l.expiryDate, CURDATE()) as daysUntilExpiry
      FROM licenses l
      JOIN employees e ON l.employeeId = e.id
      WHERE 1=1
    `;
        const params = [];
        // Enforce department-based access
        if (accessibleEmployeeIds !== null) {
            if (employeeId && typeof employeeId === 'string') {
                if (!accessibleEmployeeIds.includes(employeeId)) {
                    return res.status(403).json({ success: false, error: "Access denied to requested employee's licenses." });
                }
            }
            if (accessibleEmployeeIds.length === 0) {
                return res.json({ success: true, data: [] });
            }
            const placeholders = accessibleEmployeeIds.map(() => '?').join(',');
            sql += ` AND l.employeeId IN (${placeholders})`;
            params.push(...accessibleEmployeeIds);
        }
        else if (employeeId) {
            // Admin/HR can filter by any employee
            sql += ` AND l.employeeId = ?`;
            params.push(employeeId);
        }
        sql += ` ORDER BY l.expiryDate`;
        const licenses = await query(sql, params);
        res.json({ success: true, data: licenses });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/licenses
 * Create new license
 */
// Allow creating licenses for users who can either explicitly create licenses
// or have update permissions on licenses (e.g., HR). This enables HR to add
// licenses without changing seeded role permissions.
router.post("/", authenticate, requirePermission("licenses:update"), async (req, res) => {
    try {
        const { employeeId, type, licenseNumber, state, issueDate, expiryDate } = req.body;
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        await query(`INSERT INTO licenses (id, employeeId, type, licenseNumber, state, issueDate, expiryDate, isActive, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, 1, NOW(), NOW())`, [uuid(), employeeId, type, licenseNumber, state, issueDate, expiryDate]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=licenses.js.map