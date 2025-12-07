<%@ page import="com.cyberlearn.dao.UserDAO" %>
<%@ page import="com.cyberlearn.model.User" %>

<%
    String action = request.getParameter("action");
    String message = "";
    
    if ("setup".equals(action)) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if (name != null && !name.isEmpty() && email != null && !email.isEmpty() && password != null && !password.isEmpty()) {
            User newAdmin = new User();
            newAdmin.setName(name);
            newAdmin.setEmail(email);
            newAdmin.setPassword(password);
            newAdmin.setRole("admin");
            
            UserDAO dao = new UserDAO();
            if (dao.register(newAdmin)) {
                message = "Admin user created successfully! Please login with your credentials.";
            } else {
                message = "Failed to create admin user. Email might already exist.";
            }
        }
    }
%>

<%@ include file="/includes/header.jsp" %>

<div class="container" style="max-width:500px; margin-top:40px;">

    <div class="card p-4">
        <h2 class="text-center mb-4">Admin Setup</h2>

        <% if (!message.isEmpty()) { %>
            <div class="alert alert-info"><%= message %></div>
        <% } %>

        <form method="post">
            <input type="hidden" name="action" value="setup">

            <div class="mb-3">
                <label for="name" class="form-label">Admin Name:</label>
                <input type="text" id="name" name="name" class="form-control" required placeholder="Full Name">
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Admin Email:</label>
                <input type="email" id="email" name="email" class="form-control" required placeholder="admin@example.com">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Admin Password:</label>
                <input type="password" id="password" name="password" class="form-control" required placeholder="Enter a strong password">
            </div>

            <button type="submit" class="btn btn-primary w-100">Create Admin Account</button>
        </form>

        <hr class="my-4">

        <p class="text-center text-muted">
            Already have an admin account? 
            <a href="<%= request.getContextPath() %>/login.jsp">Login here</a>
        </p>
    </div>

</div>

<%@ include file="/includes/footer.jsp" %>
