package com.cyberlearn.servlet;

import com.cyberlearn.dao.CourseDAO;
import com.cyberlearn.model.Course;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/courses")
public class CourseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        CourseDAO dao = new CourseDAO();
        List<Course> list = dao.getAllCourses();

        // Attribute correctly set
        req.setAttribute("courseList", list);

        // Forward to JSP
        RequestDispatcher rd = req.getRequestDispatcher("/courses/courses.jsp");
        rd.forward(req, resp);
    }
}
