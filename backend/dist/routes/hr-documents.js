import express from "express";
import { query } from "../config/database.js";
import { authenticate } from "../middleware/auth.js";
import { requirePermission } from "../middleware/rbac.js";
const router = express.Router();
/**
 * GET /api/hr-documents
 * Get all HR-provided documents
 */
router.get("/", authenticate, requirePermission("documents:read"), async (req, res) => {
    try {
        const { category, isRequired } = req.query;
        let sql = `SELECT * FROM hr_documents WHERE isActive = 1`;
        const params = [];
        if (category) {
            sql += " AND category = ?";
            params.push(category);
        }
        if (isRequired !== undefined) {
            sql += " AND isRequired = ?";
            params.push(isRequired === 'true' ? 1 : 0);
        }
        sql += " ORDER BY category, title";
        const documents = await query(sql, params);
        res.json({ success: true, data: documents });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/hr-documents/employee-uploads
 * Get employee document uploads (with approval status)
 * - HR/Admin can see all uploads (when no employeeId provided)
 * - Regular users can only see their own uploads
 */
router.get("/employee-uploads", authenticate, requirePermission("documents:read"), async (req, res) => {
    try {
        const { employeeId, approvalStatus } = req.query;
        const currentUser = req.user;
        const currentUserId = req.userId || currentUser?.id;
        const roles = (currentUser?.roles || []);
        const isAdmin = roles.includes("Admin") || roles.includes("HR") || roles.includes("HR Admin");
        let sql = `
      SELECT 
        edu.*,
        e.firstName,
        e.lastName,
        e.employeeId as empId,
        hd.title as hrDocumentTitle,
        approver.firstName as approverFirstName,
        approver.lastName as approverLastName
      FROM employee_document_uploads edu
      JOIN employees e ON edu.employeeId = e.id
      LEFT JOIN hr_documents hd ON edu.hrDocumentId = hd.id
      LEFT JOIN employees approver ON edu.approvedBy = approver.id
      WHERE 1=1
    `;
        const params = [];
        // Determine target employee scope
        // - Admins: if employeeId provided, filter by it; otherwise, see all (no filter by employeeId)
        // - Non-admins: always restrict to current user
        if (!currentUserId) {
            return res.status(401).json({ success: false, error: "User not authenticated" });
        }
        let targetEmployeeId = undefined;
        if (employeeId && String(employeeId).trim() !== "") {
            targetEmployeeId = String(employeeId);
        }
        else if (!isAdmin) {
            targetEmployeeId = currentUserId;
        }
        // Restrict non-admin users to their own uploads only
        if (!isAdmin && targetEmployeeId !== currentUserId) {
            return res.status(403).json({ success: false, error: "Access denied. You can only view your own uploads." });
        }
        if (targetEmployeeId) {
            sql += " AND edu.employeeId = ?";
            params.push(targetEmployeeId);
        }
        if (approvalStatus) {
            sql += " AND edu.approvalStatus = ?";
            params.push(approvalStatus);
        }
        sql += " ORDER BY edu.createdAt DESC";
        const uploads = await query(sql, params);
        res.json({ success: true, data: uploads });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * GET /api/hr-documents/:id
 * Get single HR document
 */
router.get("/:id", authenticate, requirePermission("documents:read"), async (req, res) => {
    try {
        const document = await query(`SELECT * FROM hr_documents WHERE id = ?`, [req.params.id]);
        if (document.length === 0) {
            return res.status(404).json({ success: false, error: "HR document not found" });
        }
        res.json({ success: true, data: document[0] });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/hr-documents
 * Create new HR document template
 */
router.post("/", authenticate, requirePermission("documents:create"), async (req, res) => {
    try {
        const { title, description, documentType, documentUrl, isRequired, category, } = req.body;
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        const documentId = uuid();
        await query(`INSERT INTO hr_documents 
       (id, title, description, documentType, documentUrl, isRequired, category, isActive, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, 1, NOW(), NOW())`, [
            documentId,
            title,
            description || null,
            documentType,
            documentUrl,
            isRequired ? 1 : 0,
            category || null,
        ]);
        res.json({ success: true, data: { id: documentId } });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/hr-documents/:id
 * Update HR document
 */
router.put("/:id", authenticate, requirePermission("documents:update"), async (req, res) => {
    try {
        const { title, description, documentType, documentUrl, isRequired, category, isActive, } = req.body;
        const updateFields = [];
        const params = [];
        if (title)
            updateFields.push("title = ?"), params.push(title);
        if (description !== undefined)
            updateFields.push("description = ?"), params.push(description);
        if (documentType)
            updateFields.push("documentType = ?"), params.push(documentType);
        if (documentUrl)
            updateFields.push("documentUrl = ?"), params.push(documentUrl);
        if (isRequired !== undefined)
            updateFields.push("isRequired = ?"), params.push(isRequired ? 1 : 0);
        if (category !== undefined)
            updateFields.push("category = ?"), params.push(category);
        if (isActive !== undefined)
            updateFields.push("isActive = ?"), params.push(isActive ? 1 : 0);
        updateFields.push("updatedAt = NOW()");
        params.push(req.params.id);
        await query(`UPDATE hr_documents SET ${updateFields.join(", ")} WHERE id = ?`, params);
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * POST /api/hr-documents/employee-upload
 * Employee uploads a document (triggers admin notification)
 */
router.post("/employee-upload", authenticate, requirePermission("documents:create"), async (req, res) => {
    try {
        const { employeeId, hrDocumentId, documentName, documentType, fileUrl, fileSize, mimeType, } = req.body;
        const currentUser = req.user;
        const currentUserId = req.userId || currentUser?.id;
        const roles = (currentUser?.roles || []);
        const isAdmin = roles.includes("Admin") || roles.includes("HR");
        // If employeeId not provided, default to current user; non-admins cannot upload for others
        const targetEmployeeId = employeeId || currentUserId;
        if (!targetEmployeeId) {
            return res.status(401).json({ success: false, error: "User not authenticated" });
        }
        if (!isAdmin && targetEmployeeId !== currentUserId) {
            return res.status(403).json({ success: false, error: "Access denied. You can only upload your own documents." });
        }
        const uuid = () => {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                const r = Math.random() * 16 | 0;
                const v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        };
        const uploadId = uuid();
        await query(`INSERT INTO employee_document_uploads 
       (id, employeeId, hrDocumentId, documentName, documentType, fileUrl, fileSize, mimeType, 
        approvalStatus, uploadedByEmployee, createdAt, updatedAt)
       VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'pending', 1, NOW(), NOW())`, [
            uploadId,
            targetEmployeeId,
            hrDocumentId || null,
            documentName,
            documentType,
            fileUrl,
            fileSize,
            mimeType || null,
        ]);
        // Notify HR Admins
        const admins = await query(`
      SELECT DISTINCT e.id, e.firstName, e.lastName
      FROM employees e
      JOIN employee_roles er ON e.id = er.employeeId
      JOIN roles r ON er.roleId = r.id
      WHERE r.name = 'HR Admin' AND e.isActive = 1
    `);
        for (const admin of admins) {
            const notificationId = uuid();
            await query(`INSERT INTO notifications (id, employeeId, type, title, message, link, createdAt)
         VALUES (?, ?, 'document_upload', ?, ?, ?, NOW())`, [
                notificationId,
                admin.id,
                "New Employee Document Upload",
                `Employee has uploaded a new document: ${documentName}. Please review and approve.`,
                `/hr-documents/employee-uploads/${uploadId}`,
            ]);
        }
        res.json({ success: true, data: { id: uploadId } });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/hr-documents/employee-upload/:id/approve
 * Approve employee document upload
 */
router.put("/employee-upload/:id/approve", authenticate, requirePermission("documents:approve"), async (req, res) => {
    try {
        const { id } = req.params;
        const { approvedBy } = req.body;
        await query(`UPDATE employee_document_uploads 
       SET approvalStatus = 'approved', approvedBy = ?, approvedAt = NOW(), updatedAt = NOW()
       WHERE id = ?`, [approvedBy, id]);
        // Notify employee
        const upload = await query(`SELECT employeeId, documentName FROM employee_document_uploads WHERE id = ?`, [id]);
        if (upload.length > 0) {
            const uuid = () => {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                    const r = Math.random() * 16 | 0;
                    const v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            };
            const notificationId = uuid();
            await query(`INSERT INTO notifications (id, employeeId, type, title, message, link, createdAt)
         VALUES (?, ?, 'document_approved', ?, ?, ?, NOW())`, [
                notificationId,
                upload[0].employeeId,
                "Document Approved",
                `Your document "${upload[0].documentName}" has been approved.`,
                `/employee-portal/documents`,
            ]);
        }
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
/**
 * PUT /api/hr-documents/employee-upload/:id/reject
 * Reject employee document upload
 */
router.put("/employee-upload/:id/reject", authenticate, requirePermission("documents:reject"), async (req, res) => {
    try {
        const { id } = req.params;
        const { approvedBy, rejectionReason } = req.body;
        await query(`UPDATE employee_document_uploads 
       SET approvalStatus = 'rejected', approvedBy = ?, rejectionReason = ?, updatedAt = NOW()
       WHERE id = ?`, [approvedBy, rejectionReason || null, id]);
        // Notify employee
        const upload = await query(`SELECT employeeId, documentName FROM employee_document_uploads WHERE id = ?`, [id]);
        if (upload.length > 0) {
            const uuid = () => {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                    const r = Math.random() * 16 | 0;
                    const v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            };
            const notificationId = uuid();
            await query(`INSERT INTO notifications (id, employeeId, type, title, message, link, createdAt)
         VALUES (?, ?, 'document_rejected', ?, ?, ?, NOW())`, [
                notificationId,
                upload[0].employeeId,
                "Document Rejected",
                `Your document "${upload[0].documentName}" was rejected. Reason: ${rejectionReason || 'Not specified'}`,
                `/employee-portal/documents`,
            ]);
        }
        res.json({ success: true });
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
});
export default router;
//# sourceMappingURL=hr-documents.js.map