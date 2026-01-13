<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register | Job Portal</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>

<body class="bg-light">

<div class="container">
    <div class="row justify-content-center align-items-center vh-100">

        <div class="col-md-6 col-lg-5">

            <div class="card shadow-sm">
                <div class="card-body p-4">

                    <h3 class="text-center mb-4">User Registration</h3>

                    <!-- Success message -->
                    <% if (request.getAttribute("msg") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getAttribute("msg") %>
                        </div>
                    <% } %>

                    <!-- Error message -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <form action="<%=request.getContextPath()%>/register" method="post">

                        <div class="mb-3">
                            <label class="form-label">Full Name</label>
                            <input type="text"
                                   name="fullName"
                                   class="form-control"
                                   placeholder="Enter full name"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="Enter email"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password"
                                   name="password"
                                   class="form-control"
                                   placeholder="Create password"
                                   required>
                        </div>

                        <div class="mb-4">
                            <label class="form-label">Role</label>
                            <select name="role" class="form-select" required>
                                <option value="">-- Select Role --</option>
                                <option value="SEEKER">Job Seeker</option>
                                <option value="RECRUITER">Recruiter</option>
                            </select>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">
                                Register
                            </button>
                        </div>

                    </form>

                    <hr>

                    <p class="text-center mb-0">
                        Already have an account?
                        <a href="<%=request.getContextPath()%>/login.jsp">
                            Login
                        </a>
                    </p>

                </div>
            </div>

        </div>

    </div>
</div>

</body>
</html>
