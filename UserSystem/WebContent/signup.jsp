<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Sign Up</title>
</head>
<body>
<h2>User Registration</h2>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>
<form action="signup" method="post">
    <label for="username">Username:</label>
    <input type="text" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" name="password" required>
    <br>
    <input type="submit" value="Sign Up">
</form>
<a href="login.jsp">Already have an account? Login here</a>
</body>
</html>
