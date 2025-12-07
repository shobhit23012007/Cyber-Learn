<%@ include file="/includes/header.jsp" %>

<div class="container" style="max-width: 400px; margin-top: 60px;">
    <div class="card p-4 shadow">
        <h2 class="text-center mb-4">CyberLearn Login</h2>

        <!-- Form posts to AuthServlet (/login) -->
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Email Address</label>
                <input type="email" name="email" id="email" required class="form-control"
                    placeholder="Enter your email">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" name="password" id="password" required class="form-control"
                    placeholder="Enter your password">
            </div>

            <button type="submit" class="btn btn-primary w-100">Login</button>

            <%
                String error = request.getParameter("error");
                if (error != null) {
            %>
                <div class="alert alert-danger mt-3"><%= error %></div>
            <% } %>
        </form>

        <hr class="my-4">
        <p class="text-center text-muted">
            Don't have an account?
            <a href="<%= request.getContextPath() %>/admin/setup.jsp">Create one</a>
        </p>
    </div>
</div>

<%@ include file="/includes/footer.jsp" %>
