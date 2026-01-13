<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Post Job | Recruiter</title>

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

                    <h3 class="text-center mb-4">Post New Job</h3>

                    <!-- Success Message -->
                    <% if (request.getAttribute("msg") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("msg") %>
                        </div>
                    <% } %>

                    <!-- Error Message -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <form action="<%=request.getContextPath()%>/recruiter/post-job" method="post">

                        <div class="mb-3">
                            <label class="form-label">Job Title</label>
                            <input type="text" name="jobTitle"
                                   class="form-control"
                                   placeholder="Enter job title"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Job Description</label>
                            <textarea name="jobDescription"
                                      class="form-control"
                                      rows="3"
                                      placeholder="Describe the job role"
                                      required></textarea>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Skills Required</label>
                            <input type="text" name="skillsRequired"
                                   class="form-control"
                                   placeholder="e.g. Java, Spring, SQL"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Experience (years)</label>
                            <input type="number" name="experienceRequired"
                                   class="form-control"
                                   min="0"
                                   placeholder="Required experience"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" name="location"
                                   class="form-control"
                                   placeholder="Job location"
                                   required>
                        </div>

                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">Minimum Salary</label>
                                <input type="number" name="salaryMin"
                                       class="form-control"
                                       placeholder="Minimum salary"
                                       required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">Maximum Salary</label>
                                <input type="number" name="salaryMax"
                                       class="form-control"
                                       placeholder="Maximum salary"
                                       required>
                            </div>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Job Status</label>
                            <select name="status" class="form-select" required>
                                <option value="">-- Select Job Status --</option>
                                <option value="OPEN">OPEN</option>
                                <option value="CLOSED">CLOSED</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">
                                Post Job
                            </button>
                        </div>

                    </form>

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
