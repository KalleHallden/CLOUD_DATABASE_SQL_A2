package se.chalmers.dm;
import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Random;
import se.chalmers.dm.User;

import java.util.ArrayList;
import java.util.List;

class Queries {
    public List<User> findInactiveUsers(Connection connection) {
        List<User> userList = new ArrayList<User>();

            Statement stmt = null;
            try {
                stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM TBL_USER AS U WHERE U.IsActive=b'0';");
                while (rs.next()) {
                    String fName = rs.getString("FName");
                    int id = rs.getInt("ID");
                    int ssn = rs.getInt("Ssn");
                    String lName = rs.getString("LName");
                    String email = rs.getString("Email");
                    int isActive = rs.getInt("IsActive");
                    User newUser = new User(id, ssn, fName, lName, email, isActive);
                    userList.add(newUser);
                }
                rs.close();
                stmt.close();
            } catch (Exception e) {
                System.err.println("ERROR: " + e.getMessage());
                System.exit(0);
            }
            return userList;
    }

    public List<String> findSpecialQuotes(Connection connection) {
        List<String> quoteList = new ArrayList<String>();

        Statement stmt = null;
        try {
            stmt = connection.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM WEBPAGE;");
            while (rs.next()) {
                String quote = rs.getString("Content");
                quoteList.add(quote);
            }
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            System.exit(0);
        }
        System.out.println("SIZE: " + quoteList.size());
        return quoteList;
    }
}