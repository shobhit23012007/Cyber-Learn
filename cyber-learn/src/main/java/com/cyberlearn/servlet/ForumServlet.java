package com.cyberlearn.servlet;

import com.cyberlearn.dao.ForumDAO;
import com.cyberlearn.model.ForumPost;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 * ForumServlet:
 *  - GET → show all posts
 *  - POST → add new post
 */
@WebServlet("/forum")
public class ForumServlet extends HttpServlet {

    /**
     * Display forum posts
     */
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ForumDAO dao = new ForumDAO();
        List<ForumPost> posts = dao.getAllPosts();

        req.setAttribute("postList", posts);
        req.getRequestDispatcher("forum/forum.jsp").forward(req, resp);
    }

    /**
     * Add a new forum post
     */
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String message = req.getParameter("message");

        ForumPost post = new ForumPost(0, username, message);

        ForumDAO dao = new ForumDAO();
        dao.addPost(post);

        resp.sendRedirect(req.getContextPath() + "/forum");
    }
}
