<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Create Customer</h2>

<p>
    <a href="/users">Back to customer list</a>
</p>
<form action="/users?action=create" method="post">
    <fieldset>
        <legend>Customer's information:</legend>
        <input type="text" name="name" placeholder="User's name"><p style="color: red">${mes}</p>
        <input type="text" name="email" placeholder="User's email"><p style="color: red">${mes}</p>
        <input type="text" name="address" placeholder="User's address"><p style="color: red">${mes}</p>
        <input type="submit" value="Submit"><p style="color: red">${mes}</p>
    </fieldset>
</form>
</body>
</html>
