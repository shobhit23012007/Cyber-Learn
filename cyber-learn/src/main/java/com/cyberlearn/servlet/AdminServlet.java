package com.cyberlearn.servlet;

import com.cyberlearn.dao.CourseDAO;
import com.cyberlearn.model.Course;
import com.cyberlearn.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class AdminServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }

        User user = (User) session.getAttribute("user");

        // Ensure only admin accesses admin panels
        if (user == null || !"admin".equals(session.getAttribute("role"))) {
            resp.sendRedirect(req.getContextPath() + "/login?error=admin_required");
            return;
        }

        // Get form data
        String title = req.getParameter("title");
        String description = req.getParameter("description");

        Course c = new Course();
        c.setTitle(title);
        c.setDescription(description);

        CourseDAO dao = new CourseDAO();
        int result = dao.addCourse(c);

        if (result > 0) {
            resp.sendRedirect(req.getContextPath() + "/admin/manage_courses.jsp?success=1");
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/manage_courses.jsp?error=1");
        }
    }
}
