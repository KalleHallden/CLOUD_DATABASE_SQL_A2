package se.chalmers.dm;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCTestDriver {
    // DB connection configuration
    private static String DRIVER_CLASS = "org.postgresql.Driver";
    private static String DB_USER = "postgres";
    private static String DB_PASSWORD = "";
    private static String DB_URL = "jdbc:postgresql://localhost:5432/websitedb";
    private static int EXIT_FAILURE = 1;

    public static void main(String[] args) {
        // TODO: implement JDBC1
        Connection c = null;
        Statement stmt = null;
        try {
            Class.forName(DRIVER_CLASS);
            c = DriverManager.getConnection(DB_URL);

            stmt = c.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT 15 AS retval;");
            System.out.println("RESULT: " + rs);
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }

    }
}
