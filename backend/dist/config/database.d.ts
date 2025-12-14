import mysql from "mysql2/promise";
/**
 * MySQL Database Connection Pool
 * Simple connection pool for MySQL database
 */
declare const pool: mysql.Pool;
/**
 * Get a connection from the pool
 */
export declare const getConnection: () => Promise<mysql.PoolConnection>;
/**
 * Execute a query
 */
export declare const query: (sql: string, params?: any[]) => Promise<mysql.QueryResult>;
/**
 * Execute a query and return the first result
 */
export declare const queryOne: (sql: string, params?: any[]) => Promise<mysql.OkPacket | mysql.ResultSetHeader | mysql.RowDataPacket | mysql.RowDataPacket[] | null>;
/**
 * Execute a transaction
 */
export declare const transaction: (callback: (connection: mysql.PoolConnection) => Promise<any>) => Promise<any>;
/**
 * Test database connection
 */
export declare const testConnection: () => Promise<boolean>;
/**
 * Close all connections
 */
export declare const closePool: () => Promise<void>;
export default pool;
//# sourceMappingURL=database.d.ts.map