package com.jobportal.controller;

import com.jobportal.dao.UserDAO;
import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        UserDTO user = dao.loginUser(email, password);

        if(user != null){
            HttpSession session = req.getSession();
            session.setAttribute("loggedUser", user);
            session.setAttribute("role", user.getRole());

        //Role-based redirection
            if("ADMIN".equals(user.getRole())){
                resp.sendRedirect(req.getContextPath()+"/admin/dashboard");
            }else if("RECRUITER".equals(user.getRole())){
                resp.sendRedirect(req.getContextPath()+"/recruiter/dashboard");
            }else{
                resp.sendRedirect(req.getContextPath()+"/seeker/dashboard");
            }
        }else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }

    }
}
