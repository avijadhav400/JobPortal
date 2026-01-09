<html>
<head>
    <title>User Registration</title>
</head>

<body>
<h2>Register</h2>

<form action='register' method='post'>

<label>Full Name:</label><br>
<input type='text' name='fullName' required/>
<br><br>

<label>Email:</label><br>
<input type='email' name='email' required/>
<br><br>

<label>Password:</label><br>
<input type='password' name='password' required/>
<br><br>

<label>Role:</label><br>
<select name='role' required>
    <option value=''>-- Select Role-- </option>
    <option value='SEEKER'>Job Seeker </option>
    <option value='RECRUITER'>Recruiter</option>
</select>
<br><br>

<button type='submit'>Register</button>
</form>

<br>

<% if (request.getAttribute("msg") != null) { %>
<p style='color:green'>
 <%=request.getAttribute("msg")%>
</p>
<% } %>


<% if (request.getAttribute("error") != null) { %>
<p style='color:red'>
 <%=request.getAttribute("error")%>
</p>
<% } %>

<br>
<a href='login.jsp'>Already have an account? Login</a>


</body>
</html>