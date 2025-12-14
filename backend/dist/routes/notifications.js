import express from "express";
import { query } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
const router = express.Router();
/**
 * GET /api/notifications
 * Get notifications for user
 */
router.get("/", authenticate, async (req, res) => {
    try {
        const { employeeId, unreadOnly } = req.query;
        const currentUser = req.user;
        // Use authenticated user's ID if employeeId is not provided
        // Allow admins/HR to view other employees' notifications if employeeId is provided
        let targetEmployeeId = employeeId || currentUser?.id;
        if (!targetEmployeeId) {
            return res.status(400).json({
                success: false,
                error: "Employee ID is required"
            });
        }
        // Security: Non-admin/HR users can only view their own notifications
        const roleNames = currentUser?.roles || [];
        const isAdmin = roleNames.includes("Admin");
        const isHR = roleNames.includes("HR");
        if (!isAdmin && !isHR && targetEmployeeId !== currentUser.id) {
            return res.status(403).json({
                success: false,
                error: "Access denied. You can only view your own notifications."
            });
        }
        let sql = `
      SELECT * FROM notifications WHERE employeeId = ?
    `;
        const params = [targetEmployeeId];
        if (unreadOnly === 'true') {
            sql += " AND isRead = 0";
        }
        sql += " ORDER BY createdAt DESC LIMIT 50";
        const notifications = await query(sql, params);
        res.json({ success: true, data: notifications });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/notifications/:id/read
 * Mark notification as read
 */
router.put("/:id/read", authenticate, async (req, res) => {
    try {
        const { id } = req.params;
        const currentUser = req.user;
        // Check if notification exists and belongs to the user
        const notification = await query(`SELECT employeeId FROM notifications WHERE id = ?`, [id]);
        if (notification.length === 0) {
            return res.status(404).json({
                success: false,
                error: "Notification not found"
            });
        }
        // Security: Users can only mark their own notifications as read
        const roleNames = currentUser?.roles || [];
        const isAdmin = roleNames.includes("Admin");
        const isHR = roleNames.includes("HR");
        if (!isAdmin && !isHR && notification[0].employeeId !== currentUser.id) {
            return res.status(403).json({
                success: false,
                error: "Access denied. You can only mark your own notifications as read."
            });
        }
        await query(`UPDATE notifications SET isRead = 1, readAt = NOW() WHERE id = ?`, [id]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/notifications/read-all
 * Mark all notifications as read for user
 */
router.put("/read-all", authenticate, async (req, res) => {
    try {
        const { employeeId } = req.body;
        const currentUser = req.user;
        // Use authenticated user's ID if employeeId is not provided
        const targetEmployeeId = employeeId || currentUser?.id;
        if (!targetEmployeeId) {
            return res.status(400).json({
                success: false,
                error: "Employee ID is required"
            });
        }
        // Security: Non-admin/HR users can only mark their own notifications as read
        const roleNames = currentUser?.roles || [];
        const isAdmin = roleNames.includes("Admin");
        const isHR = roleNames.includes("HR");
        if (!isAdmin && !isHR && targetEmployeeId !== currentUser.id) {
            return res.status(403).json({
                success: false,
                error: "Access denied. You can only mark your own notifications as read."
            });
        }
        await query(`UPDATE notifications SET isRead = 1, readAt = NOW() WHERE employeeId = ? AND isRead = 0`, [targetEmployeeId]);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=notifications.js.map