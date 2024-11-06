<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Software</title>
</head>
<body>
<h2>Create New Software</h2>
<% String error = (String) request.getAttribute("error"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } %>
<form action="createSoftware" method="post">
    <label for="name">Software Name:</label>
    <input type="text" name="name" required>
    <br>
    <label for="description">Description:</label>
    <textarea name="description" required></textarea>
    <br>
    <label for="access_levels">Access Levels:</label>
    <select name="access_levels">
        <option value="Read">Read</option>
        <option value="Write">Write</option>
        <option value="Admin">Admin</option>
    </select>
    <br>
    <input type="submit" value="Create Software">
</form>
</body>
</html>
