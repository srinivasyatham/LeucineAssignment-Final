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




@WebServlet("/approveRequest")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        String action = request.getParameter("action");
        String status = "Pending";

        // Determine the status based on the action
        if ("Approve".equals(action)) {
            status = "Approved";
        } else if ("Reject".equals(action)) {
            status = "Rejected";
        }

        // Update the request status in the database
        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, status);
                stmt.setInt(2, requestId);
                stmt.executeUpdate();
                
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Optionally, you can set an error message in the request scope to display on the frontend
            request.setAttribute("error", "An error occurred while updating the request status.");
            request.getRequestDispatcher("pendingRequests.jsp").forward(request, response);
            return;
        }

        // Redirect back to the pending requests page
        response.sendRedirect("pendingRequests.jsp");
    }
}
