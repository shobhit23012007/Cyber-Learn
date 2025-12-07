<%@ page import="com.cyberlearn.model.User" %>
<%@ page session="true" %>
<%@ include file="/includes/header.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dashboard.css">

<%
    User user = (User) session.getAttribute("user");
    String name = (user!=null && user.getName()!=null) ? user.getName() : "Learner";
%>

<div class="app-layout">
  <!-- SIDEBAR -->
  <aside class="app-sidebar">

      <nav class="app-nav">
        <a class="active" href="<%= request.getContextPath() %>/user/dashboard.jsp"><i class="bi bi-grid-1x2"></i> Dashboard</a>
        <a href="<%= request.getContextPath() %>/courses/courses.jsp"><i class="bi bi-journal-bookmark"></i> My Courses</a>
        <a href="<%= request.getContextPath() %>/labs/labs.jsp"><i class="bi bi-terminal"></i> Labs</a>
        <a href="<%= request.getContextPath() %>/user/certifications.jsp"><i class="bi bi-award"></i> Certifications</a>
        <a href="<%= request.getContextPath() %>/forum/forum.jsp"><i class="bi bi-chat-dots"></i> Community Forum</a>
      </nav>
  </aside>

  <!-- MAIN AREA -->
  <main class="main-area">

    <div class="topbar">
      <div>
        <h1 style="margin:0; font-size:26px;">Dashboard</h1>
        <div style="color:var(--muted); margin-top:6px;">Welcome back, <strong><%= name %></strong>! Ready to learn?</div>
      </div>

      <div style="display:flex; gap:12px; align-items:center;">
        <div style="background:rgba(255,255,255,0.02); padding:8px 12px; border-radius:10px;">
          <i class="bi bi-bell"></i>
        </div>
        <div style="background:rgba(255,255,255,0.02); padding:8px 12px; border-radius:10px;">
          <i class="bi bi-search"></i>
        </div>
      </div>
    </div>

    <div class="welcome card-dark">
      <div>
        <h2 style="margin:0 0 6px 0;">Hello, <%= name %></h2>
        <div style="color:var(--muted)">Track your progress, practice labs and earn certifications.</div>
      </div>
      <div>
        <button class="btn-teal">Continue Learning</button>
      </div>
    </div>

    <div class="grid-2">
      <div>
        <div class="card-dark" style="margin-bottom:18px;">
          <h4 style="margin:0 0 12px 0;">Courses in Progress</h4>

          <div style="margin-bottom:12px;">
            <div style="display:flex; justify-content:space-between;">
              <div><strong>Network Penetration Testing</strong></div>
              <div style="color:var(--muted)">75%</div>
            </div>
            <div class="progress-wrap">
              <div class="progress-bar-custom">
                <div class="progress-bar-fill" style="width:75%"></div>
              </div>
            </div>
          </div>

          <div>
            <div style="display:flex; justify-content:space-between;">
              <div><strong>Mobile Application Security</strong></div>
              <div style="color:var(--muted)">40%</div>
            </div>
            <div class="progress-wrap">
              <div class="progress-bar-custom">
                <div class="progress-bar-fill" style="width:40%"></div>
              </div>
            </div>
          </div>
        </div>

        <div class="card-dark">
          <h4 style="margin:0 0 12px 0;">Recent Lab Activity</h4>
          <div style="display:flex; flex-direction:column; gap:12px;">
            <div style="display:flex; justify-content:space-between; align-items:center;">
              <div>
                <div style="font-weight:600">SQL Injection Playground</div>
                <div style="color:var(--muted); font-size:13px;">Completed: 2 days ago</div>
              </div>
              <div style="background:var(--glass); padding:6px 10px; border-radius:20px; color:var(--success); font-weight:600;">Completed</div>
            </div>

            <div style="display:flex; justify-content:space-between; align-items:center;">
              <div>
                <div style="font-weight:600">Cross-Site Scripting (XSS) Challenge</div>
                <div style="color:var(--muted); font-size:13px;">Started: 8 hours ago</div>
              </div>
              <div style="background:rgba(255,255,255,0.02); padding:6px 10px; border-radius:20px; color:var(--warning); font-weight:600;">In Progress</div>
            </div>
          </div>
        </div>
      </div>

      <aside>
        <div class="card-dark" style="margin-bottom:18px; padding:18px;">
          <h5 style="margin-top:0;">Certifications</h5>
          <div style="margin-top:12px;">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:10px;">
              <div>
                <div style="font-weight:600">Certified Ethical Hacker (CEH)</div>
                <div style="color:var(--muted); font-size:13px;">Status: Not Started</div>
              </div>
            </div>
            <div style="display:flex; justify-content:space-between; align-items:center;">
              <div>
                <div style="font-weight:600">OSCP</div>
                <div style="color:var(--muted); font-size:13px;">Status: Locked</div>
              </div>
            </div>

            <div style="margin-top:12px;">
              <button class="btn-teal w-100">View All</button>
            </div>
          </div>
        </div>

        <div class="card-dark forum-card">
          <h5 style="margin-top:0;">Latest Forum Posts</h5>
          <div style="margin-top:12px;">
            <div class="post">
              <div style="width:42px; height:42px; background:rgba(255,255,255,0.03); border-radius:8px;"></div>
              <div>
                <div style="font-weight:600">How to set up a secure home lab?</div>
                <div style="color:var(--muted); font-size:13px;">by Jane Doe • 5 replies</div>
              </div>
            </div>

            <div class="post">
              <div style="width:42px; height:42px; background:rgba(255,255,255,0.03); border-radius:8px;"></div>
              <div>
                <div style="font-weight:600">Best resources for learning Python for hacking</div>
                <div style="color:var(--muted); font-size:13px;">by John Smith • 12 replies</div>
              </div>
            </div>

          </div>
        </div>
      </aside>
    </div>

  </main>
</div>

<%@ include file="/includes/footer.jsp" %>
