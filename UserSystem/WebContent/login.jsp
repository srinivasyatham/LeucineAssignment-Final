<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Login</title>
</head>
<body>
<h2>User Login</h2>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>
<form action="login" method="post">
    <h3>Admin and Manager are already having their respective login details provided by the company they can join with those credentials!!</h3>
    <label for="username">Username:</label>
    <input type="text" name="username" required>
    <br>
    <label for="password">Password:</label>
    <input type="password" name="password" required>
    <br>
    <input type="submit" value="Login">
</form>
<a href="signup.jsp">Don't have an account? Sign up here</a>
</body>
</html>
