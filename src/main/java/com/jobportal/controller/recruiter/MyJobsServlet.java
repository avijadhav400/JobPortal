package com.jobportal.controller.recruiter;

import com.jobportal.dao.JobDAO;
import com.jobportal.dto.JobDTO;
import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/recruiter/my-jobs")
public class MyJobsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("loggedUser") == null){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        UserDTO user = (UserDTO) session.getAttribute("loggedUser");

        if(!"RECRUITER".equals(user.getRole())){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        JobDAO dao = new JobDAO();
        List<JobDTO> jobs = dao.getJobsByRecruiter(user.getUserid());

        req.setAttribute("jobs", jobs);
        req.getRequestDispatcher("/recruiter/my-jobs.jsp").forward(req, resp);


    }
}
