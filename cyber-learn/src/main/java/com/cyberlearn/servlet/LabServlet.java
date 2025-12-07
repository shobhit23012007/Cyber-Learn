package com.cyberlearn.servlet;

import com.cyberlearn.dao.LabDAO;
import com.cyberlearn.model.Lab;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * LabServlet:
 *  - Show all labs to user
 */
@WebServlet("/labs")
public class LabServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        LabDAO dao = new LabDAO();
        List<Lab> list = dao.getAllLabs();

        req.setAttribute("labList", list);
        req.getRequestDispatcher("labs/labs.jsp").forward(req, resp);
    }
}
