import { transaction } from "../config/database.js";
import bcrypt from "bcryptjs";
/**
 * Update database to new role architecture
 * Adds new roles and creates test users
 */
async function updateRoles() {
    console.log("🔄 Updating database to new role architecture...");
    console.log("📡 Connecting to database...");
    try {
        const { testConnection } = await import("../config/database.js");
        const connected = await testConnection();
        if (!connected) {
            throw new Error("Database connection failed");
        }
        await transaction(async (connection) => {
            console.log("✅ Database connection established");
            // Helper function to generate UUID
            const uuid = () => {
                return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                    const r = Math.random() * 16 | 0;
                    const v = c == 'x' ? r : (r & 0x3 | 0x8);
                    return v.toString(16);
                });
            };
            // Hash password for new users
            const hashedPassword = await bcrypt.hash("Password123!", 10);
            // 1. Get all existing departments first
            console.log("📁 Getting departments...");
            const [allDeptsRows] = await connection.execute(`SELECT id, name FROM departments`);
            const deptIds = {};
            (allDeptsRows || []).forEach((d) => {
                deptIds[d.name] = d.id;
            });
            // Add new departments if they don't exist
            const departments = [
                { name: "Compounding", description: "Compounding department" },
                { name: "Fulfillment", description: "Fulfillment department" },
            ];
            for (const dept of departments) {
                if (!deptIds[dept.name]) {
                    const id = uuid();
                    deptIds[dept.name] = id;
                    try {
                        await connection.execute(`INSERT INTO departments (id, name, description, createdAt, updatedAt) 
               VALUES (?, ?, ?, NOW(), NOW())`, [id, dept.name, dept.description]);
                        console.log(`  ✅ Added department: ${dept.name}`);
                    }
                    catch (error) {
                        if (error.code === 'ER_DUP_ENTRY') {
                            // Department was added between check and insert, get it
                            const [existingRows] = await connection.execute(`SELECT id FROM departments WHERE name = ?`, [dept.name]);
                            if (existingRows && existingRows.length > 0) {
                                deptIds[dept.name] = existingRows[0].id;
                                console.log(`  ✓ Department exists: ${dept.name}`);
                            }
                        }
                        else {
                            throw error;
                        }
                    }
                }
                else {
                    console.log(`  ✓ Department exists: ${dept.name}`);
                }
            }
            // 2. Add new roles
            console.log("👥 Adding new roles...");
            const roleIds = {};
            const roles = [
                {
                    name: "Admin",
                    description: "Super role with full system access. Manages roles, departments, employees, and all approvals.",
                    permissions: JSON.stringify({
                        employees: ["create", "read", "update", "delete"],
                        roles: ["create", "read", "update", "delete"],
                        departments: ["create", "read", "update", "delete"],
                        licenses: ["create", "read", "update", "delete"],
                        pharmacy_licenses: ["create", "read", "update", "delete"],
                        training: ["create", "read", "update", "delete", "assign"],
                        scheduling: ["create", "read", "update", "delete"],
                        leave: ["read", "approve", "reject"],
                        attendance: ["read", "update"],
                        documents: ["read", "approve", "reject"],
                        policies: ["create", "read", "update", "delete"],
                        settings: ["read", "update"]
                    })
                },
                {
                    name: "HR Manager",
                    description: "Focused on HR operations: employee onboarding, document management, PTO approval, training assignment.",
                    permissions: JSON.stringify({
                        employees: ["read", "update"],
                        licenses: ["read", "update"],
                        pharmacy_licenses: ["read"],
                        training: ["create", "read", "update", "assign"],
                        scheduling: ["read"],
                        leave: ["read", "approve", "reject"],
                        attendance: ["read"],
                        documents: ["read", "approve", "reject"],
                        policies: ["read", "update"]
                    })
                },
                {
                    name: "Lead Technician",
                    description: "Supervisor/manager for technical departments. Oversees department operations, approves department PTO, manages schedules.",
                    permissions: JSON.stringify({
                        employees: ["read"],
                        licenses: ["read"],
                        pharmacy_licenses: ["read"],
                        training: ["read", "assign"],
                        scheduling: ["create", "read", "update"],
                        leave: ["read", "approve", "reject"],
                        attendance: ["read"],
                        documents: ["read", "approve"],
                        policies: ["read"]
                    })
                },
                {
                    name: "Compounding Technician",
                    description: "Employee role for Compounding department. Clock in/out, view schedules, submit PTO, complete training.",
                    permissions: JSON.stringify({
                        employees: ["read"],
                        licenses: ["read"],
                        training: ["read"],
                        scheduling: ["read"],
                        leave: ["create", "read"],
                        attendance: ["create", "read"],
                        documents: ["read", "create"],
                        policies: ["read"]
                    })
                },
                {
                    name: "Fulfillment Technician",
                    description: "Employee role for Fulfillment department. Clock in/out, view schedules, submit PTO, complete training.",
                    permissions: JSON.stringify({
                        employees: ["read"],
                        licenses: ["read"],
                        training: ["read"],
                        scheduling: ["read"],
                        leave: ["create", "read"],
                        attendance: ["create", "read"],
                        documents: ["read", "create"],
                        policies: ["read"]
                    })
                },
            ];
            for (const role of roles) {
                // Check if role exists
                const [existingRows] = await connection.execute(`SELECT id FROM roles WHERE name = ?`, [role.name]);
                if (existingRows && existingRows.length > 0 && existingRows[0].id) {
                    roleIds[role.name] = existingRows[0].id;
                    // Update existing role
                    await connection.execute(`UPDATE roles SET description = ?, permissions = ?, updatedAt = NOW() WHERE id = ?`, [role.description, role.permissions, existingRows[0].id]);
                    console.log(`  ✓ Updated role: ${role.name}`);
                }
                else {
                    const id = uuid();
                    roleIds[role.name] = id;
                    await connection.execute(`INSERT INTO roles (id, name, description, permissions, createdAt, updatedAt) 
             VALUES (?, ?, ?, ?, NOW(), NOW())`, [id, role.name, role.description, role.permissions]);
                    console.log(`  ✅ Added role: ${role.name}`);
                }
            }
            // 3. Create test users
            console.log("👤 Creating test users...");
            const testUsers = [
                { employeeId: "ADMIN001", firstName: "Admin", lastName: "User", email: "admin@emeraldsrx.com", phone: "555-0001", department: "HR", roles: ["Admin"], hireDate: "2020-01-01" },
                { employeeId: "HRM001", firstName: "HR", lastName: "Manager", email: "hrmanager@emeraldsrx.com", phone: "555-0002", department: "HR", roles: ["HR Manager"], hireDate: "2019-03-01" },
                { employeeId: "LEAD001", firstName: "Lead", lastName: "Compounding", email: "lead.compounding@emeraldsrx.com", phone: "555-0003", department: "Compounding", roles: ["Lead Technician"], hireDate: "2018-06-01" },
                { employeeId: "LEAD002", firstName: "Lead", lastName: "Fulfillment", email: "lead.fulfillment@emeraldsrx.com", phone: "555-0004", department: "Fulfillment", roles: ["Lead Technician"], hireDate: "2018-06-01" },
                { employeeId: "COMP001", firstName: "Compounding", lastName: "Tech", email: "compounding.tech@emeraldsrx.com", phone: "555-0005", department: "Compounding", roles: ["Compounding Technician"], hireDate: "2021-02-01" },
                { employeeId: "FULF001", firstName: "Fulfillment", lastName: "Tech", email: "fulfillment.tech@emeraldsrx.com", phone: "555-0006", department: "Fulfillment", roles: ["Fulfillment Technician"], hireDate: "2021-02-01" },
            ];
            for (const user of testUsers) {
                // Check if user exists
                const [existingRows] = await connection.execute(`SELECT id FROM employees WHERE email = ?`, [user.email]);
                let employeeId;
                const deptId = deptIds[user.department];
                if (!deptId) {
                    console.error(`  ❌ Department not found: ${user.department}`);
                    continue;
                }
                if (existingRows && existingRows.length > 0) {
                    employeeId = existingRows[0].id;
                    // Update existing user
                    await connection.execute(`UPDATE employees SET employeeId = ?, firstName = ?, lastName = ?, phone = ?, departmentId = ?, updatedAt = NOW() WHERE id = ?`, [user.employeeId, user.firstName, user.lastName, user.phone, deptId, employeeId]);
                    console.log(`  ✓ Updated user: ${user.email}`);
                }
                else {
                    employeeId = uuid();
                    await connection.execute(`INSERT INTO employees (id, employeeId, firstName, lastName, email, phone, hireDate, isActive, departmentId, password, createdAt, updatedAt) 
             VALUES (?, ?, ?, ?, ?, ?, ?, 1, ?, ?, NOW(), NOW())`, [employeeId, user.employeeId, user.firstName, user.lastName, user.email, user.phone, user.hireDate, deptId, hashedPassword]);
                    console.log(`  ✅ Added user: ${user.email}`);
                }
                // Remove old role assignments
                await connection.execute(`DELETE FROM employee_roles WHERE employeeId = ?`, [employeeId]);
                // Assign new roles
                for (const roleName of user.roles) {
                    if (roleIds[roleName]) {
                        await connection.execute(`INSERT INTO employee_roles (id, employeeId, roleId, createdAt) 
               VALUES (?, ?, ?, NOW())`, [uuid(), employeeId, roleIds[roleName]]);
                    }
                }
            }
            console.log("✅ Database updated successfully!");
        });
        console.log("\n📊 Summary:");
        console.log("  ✅ New roles added/updated");
        console.log("  ✅ Test users created/updated");
        console.log("\n👤 Test Users (Password: Password123!):");
        console.log("  🔴 Admin: admin@emeraldsrx.com");
        console.log("  🔵 HR Manager: hrmanager@emeraldsrx.com");
        console.log("  🟢 Lead Technician (Compounding): lead.compounding@emeraldsrx.com");
        console.log("  🟡 Lead Technician (Fulfillment): lead.fulfillment@emeraldsrx.com");
        console.log("  🟣 Compounding Technician: compounding.tech@emeraldsrx.com");
        console.log("  🟠 Fulfillment Technician: fulfillment.tech@emeraldsrx.com");
    }
    catch (error) {
        console.error("❌ Update failed:", error);
        process.exit(1);
    }
}
// Run if called directly
updateRoles()
    .then(() => {
    console.log("✅ Update completed!");
    process.exit(0);
})
    .catch((error) => {
    console.error("❌ Update failed:", error);
    process.exit(1);
});
export { updateRoles };
//# sourceMappingURL=update-to-new-roles.js.map