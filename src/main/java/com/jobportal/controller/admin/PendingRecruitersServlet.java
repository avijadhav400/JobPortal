package com.jobportal.controller.admin;

import com.jobportal.dao.UserDAO;
import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/admin/pending-recruiters")
public class PendingRecruitersServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);

        if(session == null || session.getAttribute("loggedUser") == null){
            resp.sendRedirect("..login.jsp");
            return;
        }

        UserDTO user = (UserDTO) session.getAttribute("loggedUser");

        if(!"ADMIN".equals(user.getRole())){
            resp.sendRedirect("..login.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        List<UserDTO> pendingRecruiters = dao.getPendingRecruiters();

        req.setAttribute("recruiters", pendingRecruiters);
        req.getRequestDispatcher("/admin/pending-recruiters.jsp").forward(req, resp);
    }
}
