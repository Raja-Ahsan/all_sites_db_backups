import { Request, Response, NextFunction } from "express";
/**
 * Authentication Middleware
 * Verifies JWT token from Authorization header
 */
export declare const authenticate: (req: Request, res: Response, next: NextFunction) => Response<any, Record<string, any>> | undefined;
/**
 * Optional Authentication Middleware
 * Verifies token if present, but doesn't require it
 */
export declare const optionalAuth: (req: Request, res: Response, next: NextFunction) => void;
//# sourceMappingURL=auth.d.ts.map