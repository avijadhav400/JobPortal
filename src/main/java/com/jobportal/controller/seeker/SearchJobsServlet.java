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

@WebServlet("/seeker/search-jobs")
public class SearchJobsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if (session == null || session.getAttribute("loggedUser") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        UserDTO seeker = (UserDTO) session.getAttribute("loggedUser");

        if (!"SEEKER".equals(seeker.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        String keyword = req.getParameter("keyword");
        String location = req.getParameter("location");

        keyword = (keyword == null || keyword.trim().isEmpty()) ? null : keyword;
        location = (location == null || location.trim().isEmpty()) ? null : location;


        Integer minExp = parseInt(req.getParameter("minExperience"));
        Integer minSalary = parseInt(req.getParameter("minSalary"));
        Integer maxSalary = parseInt(req.getParameter("maxSalary"));

        JobDAO dao = new JobDAO();
        List<JobDTO> jobs = dao.searchJobs(keyword, location, minExp, minSalary, maxSalary);

        Set<Integer> appliedJobIds = dao.getAppliedJobIdsBySeeker(seeker.getUserid());

        req.setAttribute("jobs", jobs);
        req.setAttribute("appliedJobIds", appliedJobIds);

        req.getRequestDispatcher("/seeker/view-jobs.jsp")
                .forward(req, resp);



    }

    private Integer parseInt(String value) {
        try {
            return (value == null || value.isEmpty()) ? null : Integer.parseInt(value);
        } catch (Exception e) {
            return null;
        }
    }
}
