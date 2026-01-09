
<h2>Welcome ${loggedUser.fullName}</h2>
<a href='<%=request.getContextPath()%>/recruiter/post-job.jsp'>
Post New Job
</a>
<br>

<a href="<%= request.getContextPath() %>/recruiter/my-jobs">
    My Posted Jobs
</a>
<br>

<a href="<%= request.getContextPath() %>/recruiter/view-applicants">
    View Applicants
</a>
<br>

<a href="<%= request.getContextPath() %>/logout">Logout</a>
