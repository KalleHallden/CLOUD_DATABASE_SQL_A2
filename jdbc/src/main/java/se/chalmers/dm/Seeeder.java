
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
            System.out.println("RESULT: " + "\\dt");
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }

    public void createWebPageTable() {
        /*creates a table called webpage with the fields ID, Url,
        Author (a foreign key pointing to a user’s ID), Content, and Popularity. The ID should
        again be an auto-incremented primary key. Use appropriate data types based on the fake data*/ 
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("CREATE TABLE WEBPAGE (ID SERIAL PRIMARY KEY, Url VARCHAR, Author INTEGER, Content VARCHAR, Popularity INTEGER, FOREIGN KEY (Author) REFERENCES TBL_USER(ID) ON DELETE CASCADE);");
            System.out.println("RESULT: " + "\\dt");
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }

    public void insertFakeUsers(int numberOfUsers) {
        int trueOrFalse = 1;
        int number = 0;
        for (int i = 0; i < numberOfUsers; i++) {
            Statement stmt = null;
            if (trueOrFalse == 1) {
                trueOrFalse = 0;
            } else{
                trueOrFalse = 1;
            }
            number +=1;
            try {
                stmt = connection.createStatement();
                System.out.println(faker.phoneNumber());
                String name = "'" + faker.name() + "'";
                String email = "'" + faker.name() + "@gmail.com'";
                String lastname = "'" + faker.name() + "'";
                ResultSet rs = stmt.executeQuery("INSERT INTO TBL_USER VALUES (" + number + ", " +  number + ", '" + name + "', '" + lastname + "', " + email + ", b'" + trueOrFalse + "')" + ";");
                System.out.println("RESULT: " + "\\d+ tbl_user");
                rs.close();
                stmt.close();
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.exit(0);
            }
        }
    }
}

















