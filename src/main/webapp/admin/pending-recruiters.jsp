<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.UserDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Pending Recruiter Approvals | Admin</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">Pending Recruiter Approvals</h3>

                    <%
                        List<UserDTO> recruiters =
                                (List<UserDTO>) request.getAttribute("recruiters");

                        if (recruiters == null || recruiters.isEmpty()) {
                    %>
                        <div class="alert alert-secondary text-center">
                            No pending recruiter approvals.
                        </div>
                    <%
                        } else {
                    %>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th class="text-center">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (UserDTO r : recruiters) {
                            %>
                                <tr>
                                    <td><%= r.getFullName() %></td>
                                    <td><%= r.getEmail() %></td>
                                    <td class="text-center">
                                        <form action="<%= request.getContextPath() %>/admin/approve-recruiter"
                                              method="post" class="d-inline">
                                            <input type="hidden" name="userId"
                                                   value="<%= r.getUserid() %>">
                                            <button type="submit"
                                                    class="btn btn-success btn-sm">
                                                Approve
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                    <%
                        }
                    %>

                    <div class="text-center mt-4">
                        <a href="<%= request.getContextPath() %>/admin/dashboard"
                           class="btn btn-outline-secondary">
                            Back to Dashboard
                        </a>
                    </div>

                </div>
            </div>

        </div>
    </div>

</div>

</body>
</html>
