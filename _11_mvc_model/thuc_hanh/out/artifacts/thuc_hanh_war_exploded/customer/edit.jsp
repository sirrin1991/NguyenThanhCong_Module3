<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/customers?action=edit" method="post">
    <fieldset>
        <legend>New information's customer:</legend>
        <input type="text" name="name" value="${customerObj.name}">
        <input type="text" name="id" value="${customerObj.id}" hidden><br><br>
        <input type="text" name="email" value="${customerObj.email}"><br><br>
        <input type="text" name="address" value="${customerObj.address}"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
</body>
</html>
