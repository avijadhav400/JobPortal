<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.ApplicantDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Job Applicants | Recruiter</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">
        <div class="col-lg-10">

            <div class="card shadow-sm">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">Job Applicants</h3>

                    <%
                        List<ApplicantDTO> applicants =
                                (List<ApplicantDTO>) request.getAttribute("applicants");

                        if (applicants == null || applicants.isEmpty()) {
                    %>
                        <div class="alert alert-secondary text-center">
                            No applicants yet.
                        </div>
                    <%
                        } else {
                    %>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Job ID</th>
                                    <th>Job Title</th>
                                    <th>Candidate Name</th>
                                    <th>Email</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (ApplicantDTO applicant : applicants) {
                            %>
                                <tr>
                                    <td><%= applicant.getJobId() %></td>
                                    <td><%= applicant.getJobTitle() %></td>
                                    <td><%= applicant.getFullName() %></td>
                                    <td><%= applicant.getEmail() %></td>
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
                        <a href="<%= request.getContextPath() %>/recruiter/dashboard"
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
