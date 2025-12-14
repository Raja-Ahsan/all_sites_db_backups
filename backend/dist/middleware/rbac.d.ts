import { Request, Response, NextFunction } from "express";
/**
 * Role-Based Access Control Middleware
 * Checks if user has required permissions
 */
export declare const requirePermission: (requiredPermission: string) => (req: Request, res: Response, next: NextFunction) => Promise<Response<any, Record<string, any>> | undefined>;
/**
 * Require specific role
 */
export declare const requireRole: (...allowedRoles: string[]) => (req: Request, res: Response, next: NextFunction) => Promise<Response<any, Record<string, any>> | undefined>;
/**
 * Check if user is manager (has manager role or is department manager)
 */
export declare const requireManager: (req: Request, res: Response, next: NextFunction) => Promise<Response<any, Record<string, any>> | undefined>;
//# sourceMappingURL=rbac.d.ts.map