import jwt from "jsonwebtoken";
/**
 * Authentication Middleware
 * Verifies JWT token from Authorization header
 */
export const authenticate = (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        if (!authHeader || !authHeader.startsWith("Bearer ")) {
            return res.status(401).json({
                success: false,
                error: "No token provided. Please log in."
            });
        }
        const token = authHeader.substring(7); // Remove "Bearer " prefix
        if (!process.env.JWT_SECRET) {
            console.error("JWT_SECRET not configured");
            return res.status(500).json({
                success: false,
                error: "Server configuration error"
            });
        }
        try {
            const decoded = jwt.verify(token, process.env.JWT_SECRET);
            // Attach user info to request
            req.user = decoded;
            // Explicit unique database user identifier
            req.userId = decoded.id;
            // Keep compatibility: employeeId on req may be used across routes
            // Ensure it is the database UUID when available, else fallback to token id
            req.employeeId = decoded.id || decoded.employeeId;
            // Prevent caching of any authenticated responses (user-specific)
            res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, private, max-age=0");
            res.setHeader("Pragma", "no-cache");
            res.setHeader("Expires", "0");
            res.setHeader("Surrogate-Control", "no-store");
            next();
        }
        catch (error) {
            if (error.name === "TokenExpiredError") {
                return res.status(401).json({
                    success: false,
                    error: "Token expired. Please log in again."
                });
            }
            return res.status(401).json({
                success: false,
                error: "Invalid token. Please log in again."
            });
        }
    }
    catch (error) {
        res.status(500).json({ success: false, error: error.message });
    }
};
/**
 * Optional Authentication Middleware
 * Verifies token if present, but doesn't require it
 */
export const optionalAuth = (req, res, next) => {
    try {
        const authHeader = req.headers.authorization;
        if (authHeader && authHeader.startsWith("Bearer ")) {
            const token = authHeader.substring(7);
            if (process.env.JWT_SECRET) {
                try {
                    const decoded = jwt.verify(token, process.env.JWT_SECRET);
                    req.user = decoded;
                    req.userId = decoded.id;
                    req.employeeId = decoded.id || decoded.employeeId;
                    // Do not cache potentially user-specific optional-auth responses
                    res.setHeader("Cache-Control", "no-store, no-cache, must-revalidate, private, max-age=0");
                    res.setHeader("Pragma", "no-cache");
                    res.setHeader("Expires", "0");
                    res.setHeader("Surrogate-Control", "no-store");
                }
                catch (error) {
                    // Token invalid, but continue without auth
                }
            }
        }
        next();
    }
    catch (error) {
        next();
    }
};
//# sourceMappingURL=auth.js.map