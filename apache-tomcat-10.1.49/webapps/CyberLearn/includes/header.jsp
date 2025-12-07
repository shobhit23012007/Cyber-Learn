<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String ctx = request.getContextPath();
%>

<!-- BOOTSTRAP CSS -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">

<!-- BOOTSTRAP ICONS -->
<link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<!-- CUSTOM CSS -->
<link rel="stylesheet" href="<%= ctx %>/assets/css/style.css">

<!-- BOOTSTRAP JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<header class="site-header container mt-4 mb-3 d-flex align-items-center gap-3">

    <!-- Logo -->
    <img src="<%= ctx %>/assets/image/logo.jpg"
         alt="Logo"
         style="width:60px; height:60px; border-radius:6px; object-fit:cover;">

    <!-- Title + Navigation -->
    <div>
        <h2 class="fw-bold mb-1">CyberLearn</h2>

        <nav class="top-nav d-flex gap-4">

            <a href="<%= ctx %>/index.jsp">Home</a>
            <a href="<%= ctx %>/courses">Courses</a>
            <a href="<%= ctx %>/labs">Labs</a>
            <a href="<%= ctx %>/forum">Forum</a>


        </nav>
    </div>

</header>
