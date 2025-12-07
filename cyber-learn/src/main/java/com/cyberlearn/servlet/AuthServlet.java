package com.cyberlearn.servlet;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.cyberlearn.dao.UserDAO;
import com.cyberlearn.model.User;
import java.io.IOException;

public class AuthServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO userDAO = new UserDAO();
        User user = userDAO.login(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getId());
            session.setAttribute("role", user.getRole());

            if (user.isAdmin()) {
                resp.sendRedirect(req.getContextPath() + "/admin/manage_courses.jsp");
            } else {
                resp.sendRedirect(req.getContextPath() + "/user/dashboard.jsp");
            }
            return;
        }

        req.setAttribute("error", "Invalid email or password!");
        req.getRequestDispatcher("/login.jsp").forward(req, resp);
    }
}
