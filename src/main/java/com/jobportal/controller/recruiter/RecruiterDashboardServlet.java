package com.jobportal.controller.recruiter;

import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/recruiter/dashboard")
public class RecruiterDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("loggedUser") == null){
            resp.sendRedirect("..login.jsp");
            return;
        }

        UserDTO user = (UserDTO) session.getAttribute("loggedUser");

        if(!"RECRUITER".equals(user.getRole())){
            resp.sendRedirect("..login.jsp");
            return;
        }

        req.getRequestDispatcher("/recruiter/dashboard.jsp").forward(req, resp);

    }
}
