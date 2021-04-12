<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/products?action=edit" method="post">
    <fieldset>
        <legend>New product's information:</legend>
        <input type="text" name="name" value="${customerObj.name}">
        <input type="text" name="id" value="${customerObj.id}" hidden><br><br>
        <input type="text" name="description" value="${customerObj.description}"><br><br>
        <input type="text" name="price" value="${customerObj.price}"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
</body>
</html>
