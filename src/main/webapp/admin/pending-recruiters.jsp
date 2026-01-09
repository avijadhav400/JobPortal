<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.*" %>

<h2>Pending Recruiter Approvals</h2>

<%
    List<UserDTO> recruiters = (List<UserDTO>) request.getAttribute("recruiters");

    if (recruiters == null || recruiters.isEmpty()) {
%>
        <p style="color:gray; font-weight:bold;">
            No pending recruiter approvals.
        </p>
<%
    } else {
%>

<table border="1">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

<%
        for (UserDTO r : recruiters) {
%>
    <tr>
        <td><%= r.getFullName() %></td>
        <td><%= r.getEmail() %></td>
        <td>
            <form action="<%= request.getContextPath() %>/admin/approve-recruiter" method="post">
                <input type="hidden" name="userId" value="<%= r.getUserid() %>">
                <button type="submit">Approve</button>
            </form>
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
<a href="<%= request.getContextPath() %>/admin/dashboard">Back</a>
