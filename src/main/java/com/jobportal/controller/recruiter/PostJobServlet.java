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

@WebServlet("/recruiter/post-job")
public class PostJobServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }

        UserDTO recruiter = (UserDTO) session.getAttribute("loggedUser");

        if(!"RECRUITER".equals(recruiter.getRole())){
            resp.sendRedirect(req.getContextPath()+"/login.jsp");
            return;
        }


        String jobTitle = req.getParameter("jobTitle");
        String jobDescription = req.getParameter("jobDescription");
        String skillsRequired = req.getParameter("skillsRequired");
        int experienceRequired = Integer.parseInt(req.getParameter("experienceRequired"));
        String location = req.getParameter("location");
        int salaryMin = Integer.parseInt(req.getParameter("salaryMin"));
        int salaryMax = Integer.parseInt(req.getParameter("salaryMax"));
        String status = req.getParameter("status");

        JobDTO dto = new JobDTO();
        dto.setRecruiterId(recruiter.getUserid());
        dto.setJobTitle(jobTitle);
        dto.setJobDescription(jobDescription);
        dto.setSkillsRequired(skillsRequired);
        dto.setExperienceRequired(experienceRequired);
        dto.setLocation(location);
        dto.setSalaryMin(salaryMin);
        dto.setSalaryMax(salaryMax);
        dto.setStatus(status);

        JobDAO dao = new JobDAO();
        boolean isInserted = dao.insertJob(dto);

        if (isInserted) {
            req.setAttribute("msg", "Job posted successfully");
        } else {
            req.setAttribute("error", "Failed to post job");
        }

        req.getRequestDispatcher("/recruiter/post-job.jsp")
                .forward(req, resp);




    }
}
