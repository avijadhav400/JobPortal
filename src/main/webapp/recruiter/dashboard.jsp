<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Recruiter Dashboard | Job Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">
    <div class="row justify-content-center align-items-center vh-100">

        <div class="col-md-7 col-lg-6">

            <div class="card shadow-sm">
                <div class="card-body p-4 text-center">

                    <h3 class="mb-4">
                        Welcome, ${loggedUser.fullName}
                    </h3>

                    <div class="d-grid gap-3">

                        <a href="<%=request.getContextPath()%>/recruiter/post-job.jsp"
                           class="btn btn-success">
                            Post New Job
                        </a>

                        <a href="<%= request.getContextPath() %>/recruiter/my-jobs"
                           class="btn btn-primary">
                            My Posted Jobs
                        </a>

                        <a href="<%= request.getContextPath() %>/recruiter/view-applicants"
                           class="btn btn-info text-white">
                            View Applicants
                        </a>

                        <a href="<%= request.getContextPath() %>/logout"
                           class="btn btn-outline-danger">
                            Logout
                        </a>

                    </div>

                </div>
            </div>

        </div>

    </div>
</div>

</body>
</html>
