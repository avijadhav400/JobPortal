<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.jobportal.dto.JobDTO" %>

<!DOCTYPE html>
<html>
<head>
    <title>Available Jobs | Job Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">


<div class="container py-5">
<!--search job-->
<form action="<%=request.getContextPath()%>/seeker/search-jobs"
      method="get" class="row g-3 mb-4">

    <div class="col-md-3">
        <input type="text" name="keyword"
               class="form-control"
               placeholder="Job title / skills"
               value="<%= request.getParameter("keyword") != null ? request.getParameter("keyword") : "" %>">
    </div>

    <div class="col-md-2">
        <input type="text" name="location"
               class="form-control"
               placeholder="Location"
               value="<%= request.getParameter("location") != null ? request.getParameter("location") : "" %>">
    </div>

    <div class="col-md-2">
        <input type="number" name="minExperience"
               class="form-control"
               placeholder="Min Exp">
    </div>

    <div class="col-md-2">
        <input type="number" name="minSalary"
               class="form-control"
               placeholder="Min Salary">
    </div>

    <div class="col-md-2">
        <input type="number" name="maxSalary"
               class="form-control"
               placeholder="Max Salary">
    </div>

    <div class="col-md-1 d-grid">
        <button class="btn btn-primary">Search</button>
    </div>
</form>

    <div class="row justify-content-center">
        <div class="col-lg-12">

            <div class="card shadow-sm">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">Available Jobs </h3>

                    <%
                        List<JobDTO> jobs =
                                (List<JobDTO>) request.getAttribute("jobs");
                        Set<Integer> appliedJobIds =
                                (Set<Integer>) request.getAttribute("appliedJobIds");

                        if (jobs == null || jobs.isEmpty()) {
                    %>
                        <div class="alert alert-secondary text-center">
                            No jobs available at this moment.
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
                                    <th>Experience</th>
                                    <th>Skills</th>
                                    <th>Salary</th>
                                    <th class="text-center">Action</th>
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
                                    <td><%= job.getExperienceRequired() %> yrs</td>
                                    <td><%= job.getSkillsRequired() %></td>
                                    <td><%= job.getSalaryMax() %></td>
                                    <td class="text-center">

                                        <%
                                            if (appliedJobIds != null &&
                                                appliedJobIds.contains(job.getJobId())) {
                                        %>
                                            <button class="btn btn-secondary btn-sm" disabled>
                                                Applied
                                            </button>
                                        <%
                                            } else {
                                        %>
                                            <form action="<%=request.getContextPath()%>/seeker/apply-job"
                                                  method="post" class="d-inline">
                                                <input type="hidden" name="jobId"
                                                       value="<%= job.getJobId() %>">
                                                <button type="submit"
                                                        class="btn btn-success btn-sm">
                                                    Apply
                                                </button>
                                            </form>
                                        <%
                                            }
                                        %>

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

                    <!-- Flash Messages -->
                    <%
                        if (session.getAttribute("msg") != null) {
                    %>
                        <div class="alert alert-success mt-3">
                            <%= session.getAttribute("msg") %>
                        </div>
                    <%
                            session.removeAttribute("msg");
                        }

                        if (session.getAttribute("error") != null) {
                    %>
                        <div class="alert alert-danger mt-3">
                            <%= session.getAttribute("error") %>
                        </div>
                    <%
                            session.removeAttribute("error");
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
