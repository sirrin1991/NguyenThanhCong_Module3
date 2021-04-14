<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Create Customer</h2>
<p style="color: red">${mes}</p>
<p>
    <a href="/users">Back to customer list</a>
</p>
<form action="/users?action=create" method="post">
    <fieldset>
        <legend>Customer's information:</legend>
        <input type="text" name="name" placeholder="User's name"><br><br>
        <input type="text" name="email" placeholder="User's email"><br><br>
        <input type="text" name="address" placeholder="User's address"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
</body>
</html>
