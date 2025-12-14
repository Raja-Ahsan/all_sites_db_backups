import { Request, Response, NextFunction } from "express";
/**
 * Department-Based Access Control Middleware
 *
 * This middleware enforces department-based access:
 * - Department Leads: Can view their own info + their department members' info (read-only)
 * - Department Members: Can only view their own info
 * - Admins/HR/Managers: Can view all (no restrictions)
 */
/**
 * Get user's department and role information
 */
export declare const getUserDepartmentInfo: (userId: string) => Promise<{
    employeeId: any;
    departmentId: any;
    departmentName: any;
    roles: any[];
    isAdmin: boolean;
    isHR: boolean;
    isManager: boolean;
    isDepartmentLead: boolean;
    isDepartmentMember: boolean;
} | null>;
/**
 * Check if user has access to view a specific employee
 * Returns true if access is allowed, false otherwise
 */
export declare const canViewEmployee: (viewerId: string, targetEmployeeId: string) => Promise<boolean>;
/**
 * Get list of employee IDs that the user can view
 * Returns array of employee IDs or null if user can view all
 */
export declare const getAccessibleEmployeeIds: (userId: string) => Promise<string[] | null>;
/**
 * Middleware to attach department access info to request
 */
export declare const attachDepartmentAccess: (req: Request, res: Response, next: NextFunction) => Promise<void>;
/**
 * Middleware to enforce department-based access control for employee viewing
 */
export declare const enforceDepartmentAccess: (req: Request, res: Response, next: NextFunction) => Promise<Response<any, Record<string, any>> | undefined>;
//# sourceMappingURL=departmentAccess.d.ts.map