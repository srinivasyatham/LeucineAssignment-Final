package com.example.servlets;

import com.example.utils.DBUtil;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        String accessType = request.getParameter("accessType");
        String reason = request.getParameter("reason");
        int softwareId = Integer.parseInt(request.getParameter("softwareId"));

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason) SELECT id, ?, ?, ? FROM users WHERE username = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, softwareId);
            stmt.setString(2, accessType);
            stmt.setString(3, reason);
            stmt.setString(4, username);
            stmt.executeUpdate();
            response.sendRedirect("requestAccess.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Request submission failed!");
            request.getRequestDispatcher("requestAccess.jsp").forward(request, response);
        }
    }
}
