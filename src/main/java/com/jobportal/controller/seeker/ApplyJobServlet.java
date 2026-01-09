package com.jobportal.controller.seeker;

import com.jobportal.dao.JobDAO;
import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/seeker/apply-job")
public class ApplyJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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

        int jobId = Integer.parseInt(req.getParameter("jobId"));
        int seekerId = seeker.getUserid();

        JobDAO dao = new JobDAO();
        if(dao.hasAlreadyApplied(jobId, seekerId)){
            session.setAttribute("error", "You have already applied for this job");
        }else{
            dao.applyJob(jobId, seekerId);
            session.setAttribute("msg", "Job applied successfully");
        }

//        req.getRequestDispatcher("/seeker/view-jobs").forward(req, resp);
        resp.sendRedirect(req.getContextPath()+"/seeker/view-jobs");



    }
}
