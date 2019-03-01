
package se.chalmers.dm;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;

class Seeder {
    Faker faker;
    Connection connection;
    Random random;
    public Seeder(Faker faker, Connection connection, Random random) {
        this.faker = faker;
        this.connection = connection;
        this.random = random;
    }

    public void createUserTable() {
        /* "tbl_user" with the fields 
        ID, Ssn, FName, LName, Email, and IsActive
        where the ID serves as primary key. */
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("CREATE TABLE TBL_USER (ID INTEGER PRIMARY KEY, Ssn INTEGER, FName VARCHAR, LName VARCHAR, Email VARCHAR, IsActive BIT);");
            System.out.println("RESULT: " + rs);
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }
}

















