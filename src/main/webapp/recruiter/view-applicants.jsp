<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.ApplicantDTO" %>

<h2>Job Applicants</h2>

<%
List<ApplicantDTO> applicants = (List<ApplicantDTO> ) request.getAttribute("applicants");
if(applicants == null || applicants.isEmpty()){
%>
<p style='color:gray; font-weight:bold'>No applicants yet.</p>
<%
}else{
%>
<table border='1'>
    <tr>
        <th>Job Id</th>
        <th>Job Title</th>
        <th>Candidate Name</th>
        <th>Email</th>
    </tr>
    <%
    for(ApplicantDTO applicant : applicants){
     %>
     <tr>
        <td><%=applicant.getJobId()%></td>
        <td><%=applicant.getJobTitle()%></td>
        <td><%=applicant.getFullName()%></td>
        <td><%=applicant.getEmail()%></td>
     </tr>
    <%
    }
   }
    %>
</table>

<%

%>
<br>
<a href='<%=request.getContextPath()%>/recruiter/dashboard'>Back</a>