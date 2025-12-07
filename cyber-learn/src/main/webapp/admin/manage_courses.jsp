<%@ page import="com.cyberlearn.model.User" %>
<%@ page session="true" %>
<%@ include file="/includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">

<%
    User user = (User) session.getAttribute("user");
    if (user == null || !user.isAdmin()) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }
%>

<div class="main-area" style="margin-left:260px; padding:28px;">
  <div class="card-dark" style="padding:24px; margin-bottom:18px;">
    <h2 style="margin:0 0 8px 0;">Admin: Add New Course</h2>

    <!-- FIXED action: must match AdminServlet doPost -->
    <form action="${pageContext.request.contextPath}/admin" method="post" style="margin-top:12px;">
      <input type="text" name="title" placeholder="Course Title" class="form-control-dark" required style="width:60%; margin-bottom:12px;">
      <textarea name="description" placeholder="Course Description" class="form-control-dark" style="width:60%; height:120px;"></textarea>
      <div style="margin-top:12px;">
        <button class="btn-teal">Add Course</button>
      </div>
    </form>
  </div>

  <div class="card-dark" style="padding:20px;">
    <h3 style="margin-top:0;">Existing Courses</h3>
    <table style="width:100%; border-collapse:collapse; margin-top:12px;">
      <thead>
        <tr style="text-align:left; color:var(--muted);">
          <th style="padding:10px 6px;">Title</th>
          <th style="padding:10px 6px;">Description</th>
          <th style="padding:10px 6px;">Actions</th>
        </tr>
      </thead>
      <tbody>

        <!-- Example row -->
        <tr style="border-top:1px solid rgba(255,255,255,0.02);">
          <td style="padding:12px 6px;">Network Penetration Testing</td>
          <td style="padding:12px 6px; color:var(--muted);">Advanced pentesting course</td>
          <td style="padding:12px 6px;">
            <a class="btn btn-teal" href="#">Edit</a>
            <a class="btn" style="background:rgba(255,255,255,0.02); color:var(--muted); margin-left:8px;" href="#">Delete</a>
          </td>
        </tr>

      </tbody>
    </table>
  </div>

</div>

<%@ include file="/includes/footer.jsp" %>
