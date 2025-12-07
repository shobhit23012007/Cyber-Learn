package com.cyberlearn.util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 * This class is responsible for providing a database connection.
 * It loads the MySQL Driver and returns a reusable Connection object.
 */
public class DBConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/cyberlearn?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASS = "1234";
    private static final String DRIVER = "com.mysql.cj.jdbc.Driver";

    static {
        try {
            Class.forName(DRIVER);
            System.out.println("[v0] MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("[v0] FATAL: MySQL JDBC Driver not found!");
            e.printStackTrace();
        }
    }

    /**
     * This method returns a MySQL connection object.
     * Returns null if connection fails, caller should check for null.
     * @return Connection or null on failure
     */
    public static Connection getConnection() {
        Connection con = null;
        try {
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("[v0] Database connection established successfully");

        } catch (com.mysql.cj.jdbc.exceptions.CommunicationsException e) {
            System.err.println("[v0] Database connection failed: MySQL server not running or unreachable");
            System.err.println("[v0] Make sure MySQL is running on localhost:3306");
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Database connection failed. Check URL, username, password, and MySQL service");
            System.err.println("[v0] URL: " + URL);
            System.err.println("[v0] USER: " + USER);
            e.printStackTrace();
        }
        return con;
    }
}
