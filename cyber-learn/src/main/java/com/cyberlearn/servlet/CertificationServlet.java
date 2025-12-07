package com.cyberlearn.servlet;

import com.cyberlearn.dao.CertificationDAO;
import com.cyberlearn.model.Certification;
import com.cyberlearn.model.User;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * CertificationServlet:
 *  - Show all certifications for logged user
 */
@WebServlet("/certifications")
public class CertificationServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        User user = (User) session.getAttribute("user");
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getId();

        CertificationDAO dao = new CertificationDAO();
        List<Certification> list = dao.getCertificationsForUser(userId);

        req.setAttribute("certList", list);
        req.getRequestDispatcher("user/certifications.jsp").forward(req, resp);
    }
}
