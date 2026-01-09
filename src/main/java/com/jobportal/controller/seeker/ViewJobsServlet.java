package com.jobportal.controller.seeker;

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
import java.util.Set;

@WebServlet("/seeker/view-jobs")
public class ViewJobsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("loggedUser") == null){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        UserDTO seeker = (UserDTO) session.getAttribute("loggedUser");

        if(!"SEEKER".equals(seeker.getRole())){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        JobDAO dao = new JobDAO();
        List<JobDTO> jobs = dao.getAllJobs();
        Set<Integer> appliedJobIds = dao.getAppliedJobIdsBySeeker(seeker.getUserid());

        req.setAttribute("appliedJobIds",appliedJobIds);
        req.setAttribute("jobs", jobs);
        req.getRequestDispatcher("/seeker/view-jobs.jsp").forward(req, resp);


    }
}
