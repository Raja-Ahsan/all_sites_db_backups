import express from "express";
import { query } from "../config/database.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";
import { authenticate } from "../middleware/auth.js";
const router = express.Router();
/**
 * POST /api/auth/login
 * Employee login
 */
router.post("/login", async (req, res) => {
    try {
        const { email, password } = req.body;
        if (!email || !password) {
            return res.status(400).json({
                success: false,
                error: "Email and password are required"
            });
        }
        // Find employee by email
        const employees = await query(`SELECT id, employeeId, email, password, firstName, lastName, isActive, departmentId
       FROM employees 
       WHERE email = ?`, [email]);
        if (employees.length === 0) {
            return res.status(401).json({
                success: false,
                error: "User not found",
                errorCode: "USER_NOT_FOUND"
            });
        }
        const employee = employees[0];
        if (!employee.isActive) {
            return res.status(403).json({
                success: false,
                error: "Account is inactive. Please contact HR.",
                errorCode: "ACCOUNT_INACTIVE"
            });
        }
        // Verify password
        const isValidPassword = await bcrypt.compare(password, employee.password);
        if (!isValidPassword) {
            return res.status(401).json({
                success: false,
                error: "Invalid password",
                errorCode: "INVALID_PASSWORD"
            });
        }
        // Get employee roles
        const roles = await query(`SELECT r.id, r.name, r.permissions
       FROM employee_roles er
       JOIN roles r ON er.roleId = r.id
       WHERE er.employeeId = ?`, [employee.id]);
        // Generate JWT token
        if (!process.env.JWT_SECRET) {
            return res.status(500).json({
                success: false,
                error: "Server configuration error"
            });
        }
        const token = jwt.sign({
            id: employee.id,
            employeeId: employee.employeeId,
            email: employee.email,
            firstName: employee.firstName,
            lastName: employee.lastName,
            departmentId: employee.departmentId,
            roles: roles.map((r) => r.name),
        }, process.env.JWT_SECRET, { expiresIn: "7d" });
        res.json({
            success: true,
            data: {
                token,
                employee: {
                    id: employee.id,
                    employeeId: employee.employeeId,
                    email: employee.email,
                    firstName: employee.firstName,
                    lastName: employee.lastName,
                    departmentId: employee.departmentId,
                    roles: roles.map((r) => ({ id: r.id, name: r.name })),
                },
            },
        });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/auth/permissions
 * Get current user's permissions from all roles
 * Requires authentication
 */
router.get("/permissions", authenticate, async (req, res) => {
    try {
        const employeeId = req.employeeId;
        const user = req.user;
        if (!employeeId || !user) {
            return res.status(401).json({
                success: false,
                error: "Authentication required"
            });
        }
        // Get user's roles and permissions
        const roles = await query(`SELECT r.permissions
       FROM employee_roles er
       JOIN roles r ON er.roleId = r.id
       WHERE er.employeeId = ?`, [user.id]);
        // Get individual employee permissions (if any)
        const [employeePermsRows] = await query(`SELECT permissions FROM employee_permissions WHERE employeeId = ?`, [user.id]);
        const individualPermissions = employeePermsRows && employeePermsRows.length > 0
            ? (typeof employeePermsRows[0].permissions === 'string'
                ? JSON.parse(employeePermsRows[0].permissions)
                : employeePermsRows[0].permissions)
            : null;
        // Start with individual permissions if they exist (they override role permissions)
        const mergedPermissions = individualPermissions
            ? JSON.parse(JSON.stringify(individualPermissions)) // Deep copy
            : {};
        // Merge permissions from all roles (only if no individual permissions exist for that module)
        for (const role of roles) {
            const permissions = typeof role.permissions === 'string'
                ? JSON.parse(role.permissions)
                : role.permissions;
            // Merge permissions - combine all actions for each module
            for (const [module, actions] of Object.entries(permissions)) {
                if (Array.isArray(actions)) {
                    // If individual permissions exist for this module, skip role permissions
                    if (individualPermissions && individualPermissions[module]) {
                        continue;
                    }
                    if (!mergedPermissions[module]) {
                        mergedPermissions[module] = [];
                    }
                    // Add unique actions
                    actions.forEach((action) => {
                        if (!mergedPermissions[module].includes(action)) {
                            mergedPermissions[module].push(action);
                        }
                    });
                }
            }
        }
        res.json({
            success: true,
            data: {
                permissions: mergedPermissions,
            },
        });
    }
    catch (error) {
        if (error.name === "JsonWebTokenError" || error.name === "TokenExpiredError") {
            return res.status(401).json({
                success: false,
                error: "Invalid or expired token"
            });
        }
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/auth/me
 * Get current user info
 */
router.get("/me", authenticate, async (req, res) => {
    try {
        const userId = req.userId;
        const user = req.user;
        if (!userId || !user) {
            return res.status(401).json({ success: false, error: "Authentication required" });
        }
        // Get fresh employee data
        const employees = await query(`SELECT id, employeeId, email, firstName, lastName, isActive, departmentId
       FROM employees 
       WHERE id = ?`, [userId]);
        if (employees.length === 0) {
            return res.status(404).json({
                success: false,
                error: "Employee not found"
            });
        }
        const employee = employees[0];
        // Get roles
        const roles = await query(`SELECT r.id, r.name
       FROM employee_roles er
       JOIN roles r ON er.roleId = r.id
       WHERE er.employeeId = ?`, [employee.id]);
        res.json({
            success: true,
            data: {
                id: employee.id,
                employeeId: employee.employeeId,
                email: employee.email,
                firstName: employee.firstName,
                lastName: employee.lastName,
                departmentId: employee.departmentId,
                roles: roles.map((r) => ({ id: r.id, name: r.name })),
            },
        });
    }
    catch (error) {
        if (error.name === "JsonWebTokenError" || error.name === "TokenExpiredError") {
            return res.status(401).json({
                success: false,
                error: "Invalid or expired token"
            });
        }
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=auth.js.map