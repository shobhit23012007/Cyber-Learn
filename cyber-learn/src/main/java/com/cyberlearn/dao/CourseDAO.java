package com.cyberlearn.dao;

import com.cyberlearn.model.Course;
import com.cyberlearn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CourseDAO {

    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT id, title, description FROM courses ORDER BY id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("id"));
                c.setTitle(rs.getString("title"));
                c.setDescription(rs.getString("description"));
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public int addCourse(Course course) {
        String sql = "INSERT INTO courses (title, description) VALUES (?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, course.getTitle());
            ps.setString(2, course.getDescription());

            int rows = ps.executeUpdate();
            if (rows == 0) return -1;

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) return keys.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
