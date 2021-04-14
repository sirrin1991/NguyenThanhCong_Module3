<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/users?action=edit" method="post">
    <fieldset>
        <legend>New user's information:</legend>
        <input type="text" name="name" value="${userObj.name}">
        <input type="text" name="id" value="${userObj.id}" hidden><br><br>
        <input type="text" name="email" value="${userObj.email}"><br><br>
        <input type="text" name="address" value="${userObj.address}"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
</body>
</html>
