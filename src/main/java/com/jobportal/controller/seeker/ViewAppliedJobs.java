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

@WebServlet("/seeker/view-applied-jobs")
public class ViewAppliedJobs extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session == null && session.getAttribute("loggedUser")==null){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        UserDTO seeker = (UserDTO) session.getAttribute("loggedUser");

        if(!"SEEKER".equals(seeker.getRole())){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        JobDAO dao = new JobDAO();
        List<JobDTO> jobs = dao.getAppliedJobsBySeeker(seeker.getUserid());

        req.setAttribute("jobs", jobs);
        req.getRequestDispatcher("/seeker/view-applied-jobs.jsp")
                .forward(req, resp);


    }
}
