<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.utils.DBUtil" %>
<html>
<head>
    <title>Pending Access Requests</title>
</head>
<body>
<h2>Pending Access Requests</h2>
<table border="1">
    <tr>
        <th>Employee Name</th>
        <th>Software Name</th>
        <th>Access Type</th>
        <th>Reason</th>
        <th>Action</th>
    </tr>

<% 
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        conn = DBUtil.getConnection();
        stmt = conn.createStatement();
        String sql = "SELECT r.id, u.username, s.name AS software_name, r.access_type, r.reason " +
                     "FROM requests r " +
                     "JOIN users u ON r.user_id = u.id " +
                     "JOIN software s ON r.software_id = s.id " +
                     "WHERE r.status = 'Pending'";
        rs = stmt.executeQuery(sql);
        
        while (rs.next()) {
%>
            <tr>
                <td><%= rs.getString("username") %></td>
                <td><%= rs.getString("software_name") %></td>
                <td><%= rs.getString("access_type") %></td>
                <td><%= rs.getString("reason") %></td>
                <td>
                    <form action="approveRequest" method="post" style="display:inline;">
                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                        <input type="submit" name="action" value="Approve">
                    </form>
                    <form action="approveRequest" method="post" style="display:inline;">
                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                        <input type="submit" name="action" value="Reject">
                    </form>
                </td>
            </tr>
<%
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (rs != null) try { rs.close(); } catch (SQLException e) {}
        if (stmt != null) try { stmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>
</table>
</body>
</html>
