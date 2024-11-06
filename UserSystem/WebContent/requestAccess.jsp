<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBUtil" %>
<html>
<head>
    <title>Request Access</title>
</head>
<body>
<h2>Request Access to Software</h2>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>

<% 
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    String sql = "SELECT * FROM software"; // Retrieve all software

    try {
        conn = DBUtil.getConnection();
        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);
%>

<form action="requestAccess" method="post">
    <label for="softwareId">Select Software:</label>
    <select name="softwareId" required>
        <% while (rs.next()) { %>
            <option value="<%= rs.getInt("id") %>"><%= rs.getString("name") %></option>
        <% } %>
    </select>
    <br>
    <label for="accessType">Access Type:</label>
    <select name="accessType" required>
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select>
    <br>
    <label for="reason">Reason for Request:</label>
    <textarea name="reason" required></textarea>
    <br>
    <input type="submit" value="Request Access">
</form>

<% 
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</body>
</html>
