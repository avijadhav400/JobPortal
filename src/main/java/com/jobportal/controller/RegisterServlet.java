package com.jobportal.controller;

import com.jobportal.dao.UserDAO;
import com.jobportal.dto.UserDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        String status;
        if("RECRUITER".equals(role)){
            status = "PENDING";
        }else {
            status = "ACTIVE";
        }

        UserDTO user = new UserDTO();
        user.setFullName(fullName);
        user.setRole(role);
        user.setStatus(status);
        user.setEmail(email);
        user.setPassword(password);

        UserDAO dao = new UserDAO();
        boolean isRegistered = dao.registerUser(user);

        if(isRegistered){
            req.setAttribute("msg", "Registration successfull. Please login.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }else{
            req.setAttribute("error", "Registration failed. Email may already exist.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
