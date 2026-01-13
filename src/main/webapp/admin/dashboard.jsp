<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard | Job Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">
    <div class="row justify-content-center align-items-center vh-100">

        <div class="col-md-6 col-lg-5">

            <div class="card shadow-sm">
                <div class="card-body p-4 text-center">

                    <h3 class="mb-4">
                        Welcome, ${loggedUser.fullName}
                    </h3>

                    <div class="d-grid gap-3">

                        <a href="${pageContext.request.contextPath}/admin/pending-recruiters"
                           class="btn btn-primary">
                            Approve Recruiters
                        </a>

                        <a href="${pageContext.request.contextPath}/logout"
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
