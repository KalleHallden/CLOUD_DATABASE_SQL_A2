package se.chalmers.dm;

import java.sql.Connection;
import java.sql.DriverManager;

class ConnectionHelper {
    private static String DRIVER_CLASS = "org.postgresql.Driver";
    private static String DB_URL = "jdbc:postgresql://localhost:5432/websitedb";

    public static Connection createPostgresConnection() {
        Connection c = null;
        try {
            Class.forName(DRIVER_CLASS);
            c = DriverManager.getConnection(DB_URL);
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
        return c;
    }
}