package com.cyberlearn.dao;

import com.cyberlearn.model.Certification;
import com.cyberlearn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * CertificationDAO - store and retrieve user certifications.
 */
public class CertificationDAO {

    /**
     * Issue/generate certification for a user for a course.
     * Returns generated id or -1 on failure.
     */
    public int addCertification(Certification cert) {
        String sql = "INSERT INTO certifications (user_id, course_name) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, cert.getUserId());
            ps.setString(2, cert.getCourseName());
            int rows = ps.executeUpdate();
            if (rows == 0) return -1;

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    /**
     * Get all certifications for a user.
     */
    public List<Certification> getCertificationsForUser(int userId) {
        List<Certification> list = new ArrayList<>();
        String sql = "SELECT id, user_id, course_name FROM certifications WHERE user_id = ? ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Certification c = new Certification();
                    c.setId(rs.getInt("id"));
                    c.setUserId(rs.getInt("user_id"));
                    c.setCourseName(rs.getString("course_name"));
                    list.add(c);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
