<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/11/2021
  Time: 11:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Are you sure ?</h2>
<form action="/customers?action=delete" method="post">
    <input type="text" name="id" value="${customerObj.id}" hidden>
    <input type="submit" name="name" value="Yes">
    <input type="submit" name="name" value="No">
</form>
</body>
</html>
