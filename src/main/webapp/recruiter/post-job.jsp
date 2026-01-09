<form action='<%=request.getContextPath()%>/recruiter/post-job' method='post'>


    <label>Job Title:</label><br>
    <input type='text' name='jobTitle' required/>
    <br><br>

    <label>Job Description:</label><br>
    <input type='text' name='jobDescription' required/>
    <br><br>

    <label>Skills Required:</label><br>
    <input type='text' name='skillsRequired' required/>
    <br><br>

    <label>Experience (years):</label><br>
    <input type='text' name='experienceRequired' required/>
    <br><br>

    <label>Location:</label><br>
    <input type='text' name='location' required/>
    <br><br>

     <label>Minimum Salary:</label><br>
     <input type='number' name='salaryMin' required/>
     <br><br>

     <label>Maximum Salary:</label><br>
     <input type='number' name='salaryMax' required/>
     <br><br>

     <label>Status:</label><br>
     <select name='status' required>
          <option value=''>--Select Job Status--</option>
          <option value='OPEN'>OPEN</option>
          <option value='CLOSED'>CLOSED</option>
     </select>
     <br><br>

<button type='submit'>Post Job</button>
</form>
<br>

<%
if(request.getAttribute("msg")!=null){
%>
<p style='color:green'>
<%= request.getAttribute("msg") %>
</p>
<%
}
%>

<%
if(request.getAttribute("error")!=null){
%>
<p style='color:red'>
<%= request.getAttribute("error") %>
</p>
<%
}
%>

<br>
<a href='<%= request.getContextPath() %>/recruiter/dashboard'>
Back
</a>