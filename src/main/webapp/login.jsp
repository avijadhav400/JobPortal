<h2>Login</h2>
<form action='login' method='post'>
Email: <input type='text' name='email' required/>
<br><br>
Password: <input type='password' name='password' required/>
<br><br>

<button type='submit'>Login</button>

<br>
<br>
<a href='<%=request.getContextPath()%>/register.jsp'>Register</a>


</form>


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