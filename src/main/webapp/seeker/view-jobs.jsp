<%@ page import="java.util.*" %>
<%@ page import="com.jobportal.dto.JobDTO" %>
<h2>Available Jobs</h2>
<%
List<JobDTO> jobs = (List<JobDTO>) request.getAttribute("jobs");
Set<Integer> appliedJobIds = (Set<Integer>) request.getAttribute("appliedJobIds");
if(jobs == null || jobs.isEmpty()){
%>
<p style='color:gray; font-weight:bold'>No jobs available at this moment.</p>
<%
}else{
%>
<table border='1'>
<tr>
    <th>Title</th>
    <th>Description</th>
    <th>Location</th>
    <th>Experience</th>
    <th>Skills</th>
    <th>Salary</th>
    <th>Action</th>
</tr>

<%
    for(JobDTO job : jobs){
%>
<tr>
    <td><%=job.getJobTitle()%></td>
    <td><%=job.getJobDescription()%></td>
    <td><%=job.getLocation()%></td>
    <td><%=job.getExperienceRequired()%></td>
    <td><%=job.getSkillsRequired()%></td>
    <td><%=job.getSalaryMax()%></td>
    <td>
    <%
    if(appliedJobIds != null && appliedJobIds.contains(job.getJobId())){
    %>
    <button disabled style='color:grey'>Applied</button>
    <%
    }else{
    %>
        <form action='<%=request.getContextPath()%>/seeker/apply-job' method='post'>
            <input type='hidden' name='jobId' value='<%=job.getJobId()%>' />
            <button type='submit'>Apply</button>
        </form>
    <%
    }
    %>
    </td>
</tr>
<%
}
%>
</table>
<%
}
%>
<br>

<%
if(session.getAttribute("msg")!=null){
%>
<p style='color:green'><%=session.getAttribute("msg")%></p>
<%
session.removeAttribute("msg");
}
%>

<%
if(session.getAttribute("error")!=null){
%>
<p style='color:red'><%=session.getAttribute("error")%></p>
<%
session.removeAttribute("error");
}
%>

<a href='<%=request.getContextPath()%>/seeker/dashboard'>Back</a>