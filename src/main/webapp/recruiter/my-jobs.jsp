<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.JobDTO" %>

<h2>My Posted Jobs</h2>

<%
    List<JobDTO> jobs = (List<JobDTO>) request.getAttribute("jobs");

    if (jobs == null || jobs.isEmpty()) {
%>
        <p style="color:gray; font-weight:bold;">
            You have not posted any jobs yet.
        </p>
<%
    } else {
%>

<table border="1">
    <tr>
        <th>Title</th>
        <th>Description</th>
        <th>Skills</th>
        <th>Location</th>
        <th>Experience</th>
        <th>Min. Salary</th>
        <th>Max. Salary</th>
    </tr>

<%
        for (JobDTO job : jobs) {
%>
    <tr>
        <td><%= job.getJobTitle() %></td>
        <td><%= job.getJobDescription() %></td>
        <td><%= job.getSkillsRequired() %></td>
        <td><%= job.getLocation() %></td>
        <td><%= job.getExperienceRequired() %> yrs</td>
        <td><%= job.getSalaryMin() %></td>
        <td><%= job.getSalaryMax() %></td>
    </tr>
<%
        }
%>
</table>

<%
    }
%>

<br>
<a href="<%= request.getContextPath() %>/recruiter/dashboard">Back</a>
