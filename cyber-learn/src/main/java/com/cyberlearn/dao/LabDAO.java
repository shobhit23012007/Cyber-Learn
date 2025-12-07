package com.cyberlearn.dao;

import com.cyberlearn.model.Lab;
import com.cyberlearn.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * LabDAO - handles practice labs
 * - getAllLabs()
 * - addLab()
 * - getLabById()
 */
public class LabDAO {

    public List<Lab> getAllLabs() {
        List<Lab> list = new ArrayList<>();
        String sql = "SELECT id, name, details FROM labs ORDER BY id DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Lab l = new Lab();
                l.setId(rs.getInt("id"));
                l.setName(rs.getString("name"));
                l.setDetails(rs.getString("details"));
                list.add(l);
            }

        } catch (SQLException e) {
            System.err.println("[v0] SQL Error fetching labs: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Error in getAllLabs: " + e.getMessage());
            e.printStackTrace();
        }
        return list;
    }

    public int addLab(Lab lab) {
        String sql = "INSERT INTO labs (name, details) VALUES (?, ?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            if (con == null) {
                System.err.println("[v0] Database connection is null");
                return -1;
            }

            ps.setString(1, lab.getName());
            ps.setString(2, lab.getDetails());
            int rows = ps.executeUpdate();
            if (rows == 0) return -1;

            try (ResultSet keys = ps.getGeneratedKeys()) {
                if (keys.next()) return keys.getInt(1);
            }

        } catch (SQLException e) {
            System.err.println("[v0] SQL Error adding lab: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Error in addLab: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }

    public Lab getLabById(int id) {
        String sql = "SELECT id, name, details FROM labs WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            if (con == null) {
                System.err.println("[v0] Database connection is null");
                return null;
            }

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    Lab l = new Lab();
                    l.setId(rs.getInt("id"));
                    l.setName(rs.getString("name"));
                    l.setDetails(rs.getString("details"));
                    return l;
                }
            }

        } catch (SQLException e) {
            System.err.println("[v0] SQL Error fetching lab by id: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("[v0] Error in getLabById: " + e.getMessage());
            e.printStackTrace();
        }
        return null;
    }
}
