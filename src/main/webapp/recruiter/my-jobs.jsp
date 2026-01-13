<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jobportal.dto.JobDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>My Posted Jobs | Recruiter</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <div class="row justify-content-center">
        <div class="col-lg-11">

            <div class="card shadow-sm">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">My Posted Jobs</h3>

                    <%
                        List<JobDTO> jobs = (List<JobDTO>) request.getAttribute("jobs");

                        if (jobs == null || jobs.isEmpty()) {
                    %>
                        <div class="alert alert-secondary text-center">
                            You have not posted any jobs yet.
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
                                    <th>Skills</th>
                                    <th>Location</th>
                                    <th>Experience</th>
                                    <th>Min Salary</th>
                                    <th>Max Salary</th>
                                </tr>
                            </thead>
                            <tbody>
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
