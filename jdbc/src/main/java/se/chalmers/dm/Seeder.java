
package se.chalmers.dm;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;
import se.chalmers.dm.User;

class Seeder {
    Faker faker;
    Connection connection;
    Random random;
    static int idNumbers;
    static int webPageId;
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
            stmt.execute("CREATE TABLE TBL_USER (ID INTEGER PRIMARY KEY, Ssn INTEGER, FName VARCHAR, LName VARCHAR, Email VARCHAR, IsActive BIT);");
            //System.out.println("RESULT: " + "\\dt");
            // rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }

    public void insertFakeUsersWithWebPage(int numberOfUsers) {
        int trueOrFalse = 1;
        for (int i = 0; i < numberOfUsers; i++) {
            // create new user then add to the database
            Statement stmt = null;
            if (trueOrFalse == 1) {
                trueOrFalse = 0;
            } else{
                trueOrFalse = 1;
            }
            idNumbers +=1;
            webPageId += 1;
            try {
                stmt = connection.createStatement();
                String name = "" + faker.name() + "";
                String email = "" + faker.name() + "@gmail.com";
                String lastname = "" + faker.name() + "";
                stmt.execute("INSERT INTO TBL_USER VALUES (" + idNumbers + ", " +  faker.idNumber().ssnValid() + ", '" + faker.name().firstName() + "', '" + faker.name().lastName().replace("'", "") + "', '" + faker.internet().emailAddress() + "', b'" + faker.number().numberBetween(0, 1) + "')" + ";"); 
                // rs.close();
                stmt.close();
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.exit(0);
            }
            try {
                stmt = connection.createStatement();
                String name = "" + faker.name() + "";
                String email = "" + faker.name() + "@gmail.com";
                String lastname = "" + faker.name() + "";
                // (ID SERIAL PRIMARY KEY, Url VARCHAR, Author INTEGER, Content VARCHAR, Popularity INTEGER, FOREIGN KEY (Author) REFERENCES TBL_USER(ID) ON DELETE CASCADE);
                stmt.execute("INSERT INTO WEBPAGE VALUES (" + webPageId + ", '" + faker.internet().url() + "', "+  idNumbers + ", '" + faker.chuckNorris().fact().replace("'", " ") + "', " + faker.number().numberBetween(0, 100) + ");");                
                // rs.close();
                stmt.close();
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.exit(0);
            }
        }
    }

    public void dropEverythingUSER() {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            stmt.execute("DROP TABLE tbl_user;");
            System.out.println("RESULT: " + "\\dt;");
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }

    public void dropEverythingWEBPAGE() {
        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            stmt.execute("DROP TABLE webpage;");
            System.out.println("RESULT: " + "\\dt;");
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
            stmt.execute("CREATE TABLE WEBPAGE (ID SERIAL PRIMARY KEY, Url VARCHAR, Author INTEGER, Content VARCHAR, Popularity INTEGER, FOREIGN KEY (Author) REFERENCES TBL_USER(ID) ON DELETE CASCADE);");
            //System.out.println("RESULT: " + "\\dt");
            //rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
    }

    public void insertFakeUsers(int numberOfUsers) {
        int trueOrFalse = 1;
        for (int i = 0; i < numberOfUsers; i++) {
            // create new user then add to the database
            Statement stmt = null;
            if (trueOrFalse == 1) {
                trueOrFalse = 0;
            } else{
                trueOrFalse = 1;
            }
            idNumbers +=1;
            try {
                stmt = connection.createStatement();
                String name = "'" + faker.name() + "'";
                String email = "'" + faker.name() + "'";
                String lastname = "'" + faker.name() + "'";
                stmt.execute("INSERT INTO TBL_USER VALUES (" + idNumbers + ", " +  faker.idNumber().ssnValid() + ", '" + faker.name().firstName() + "', '" + faker.name().lastName().replace("'", "") + "', '" + faker.internet().emailAddress() + "', b'" + faker.number().numberBetween(0, 1) + "')" + ";");
                //System.out.println("RESULT: " + "\\d+ tbl_user");
                //rs.close();
                stmt.close();
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.exit(0);
            }
        }
    }
}

















