<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.*" %>

<h2>Your Applied Jobs</h2>

<%
List<JobDTO> jobs = (List<JobDTO>) request.getAttribute("jobs");
if(jobs == null || jobs.isEmpty()){
%>
<p style='color:grey; font-weight: bold'>You have not applied for any job yet</p>
<%
}else{
%>
<table border = '1'>
<tr>
    <th>Title</th>
    <th>Description</th>
    <th>Location</th>
    <th>Salary</th>
</tr>
<%
for(JobDTO job : jobs){
%>
<tr>
    <td><%=job.getJobTitle()%></td>
    <td><%=job.getJobDescription()%></td>
    <td><%=job.getLocation()%></td>
    <td><%=job.getSalaryMax()%></td>
</tr>
<%
}
}
%>
</table>

<br>
<a href='<%=request.getContextPath()%>/seeker/dashboard'>Back</a>
