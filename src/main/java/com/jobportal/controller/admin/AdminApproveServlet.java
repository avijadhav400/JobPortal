package com.jobportal.controller.admin;

import com.jobportal.dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/admin/approve-recruiter")
public class AdminApproveServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int userid = Integer.parseInt(req.getParameter("userId"));

        UserDAO dao = new UserDAO();
        dao.approveRecruiter(userid);

        resp.sendRedirect(req.getContextPath()+"/admin/pending-recruiters.jsp");
    }
}
