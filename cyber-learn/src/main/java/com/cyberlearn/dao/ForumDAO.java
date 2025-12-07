package com.cyberlearn.dao;

import com.cyberlearn.model.ForumPost;
import com.cyberlearn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * ForumDAO - add/view forum posts
 */
public class ForumDAO {

    /**
     * Add a forum post. Returns generated id or -1 on failure.
     */
    public int addPost(ForumPost post) {
        String sql = "INSERT INTO forum_posts (user_name, message) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            if (con == null) {
                System.err.println("[v0] Database connection is null");
                return -1;
            }

            ps.setString(1, post.getUserName());
            ps.setString(2, post.getMessage());
            int rows = ps.executeUpdate();
            if (rows == 0) return -1;

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }

        } catch (SQLException e) {
            System.err.println("[v0] SQL Error adding forum post: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Error in addPost: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * Return all forum posts (latest first).
     */
    public List<ForumPost> getAllPosts() {
        List<ForumPost> list = new ArrayList<>();
        String sql = "SELECT id, user_name, message FROM forum_posts ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                ForumPost p = new ForumPost();
                p.setId(rs.getInt("id"));
                p.setUserName(rs.getString("user_name"));
                p.setMessage(rs.getString("message"));
                list.add(p);
            }

        } catch (SQLException e) {
            System.err.println("[v0] SQL Error fetching forum posts: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Error in getAllPosts: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }
}
