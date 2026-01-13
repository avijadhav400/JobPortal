<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.JobDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Applied Jobs | Job Portal</title>

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

                    <h3 class="text-center mb-4">Your Applied Jobs</h3>

                    <%
                        List<JobDTO> jobs =
                                (List<JobDTO>) request.getAttribute("jobs");

                        if (jobs == null || jobs.isEmpty()) {
                    %>
                        <div class="alert alert-secondary text-center">
                            You have not applied for any jobs yet.
                        </div>
                    <%
                        } else {
                    %>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Title</th>
                                    <th>Description</th>
                                    <th>Location</th>
                                    <th>Salary</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
                                for (JobDTO job : jobs) {
                            %>
                                <tr>
                                    <td><%= job.getJobTitle() %></td>
                                    <td><%= job.getJobDescription() %></td>
                                    <td><%= job.getLocation() %></td>
                                    <td><%= job.getSalaryMax() %></td>
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
                        <a href="<%= request.getContextPath() %>/seeker/dashboard"
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
