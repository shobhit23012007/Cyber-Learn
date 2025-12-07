package com.cyberlearn.dao;

import com.cyberlearn.model.User;
import com.cyberlearn.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * UserDAO - handles user related DB operations:
 *  - register user
 *  - login user (fetch by email+password)
 *  - fetch user by id
 */
public class UserDAO {

    /**
     * Registers a new user. Returns true if inserted successfully.
     */
    public boolean register(User user) {
        String sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Attempts login by email and password.
     * Returns User object if success, otherwise null.
     */
    public User login(String email, String password) {
        String sql = "SELECT id, name, email, password, role FROM users WHERE email = ? AND password = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, password);

            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setId(rs.getInt("id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getString("role"));
                    return u;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Fetch a user by id.
     */
    public User getById(int id) {
        String sql = "SELECT id, name, email, password, role FROM users WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User u = new User();
                    u.setId(rs.getInt("id"));
                    u.setName(rs.getString("name"));
                    u.setEmail(rs.getString("email"));
                    u.setPassword(rs.getString("password"));
                    u.setRole(rs.getString("role"));
                    return u;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
