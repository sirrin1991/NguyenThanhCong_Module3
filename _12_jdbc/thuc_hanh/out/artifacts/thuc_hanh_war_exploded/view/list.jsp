<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Customers</h1>
<p>
    <a href="/users?action=create">Create new customer</a>
</p>
<table border="1px" style="border-collapse: collapse">
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${listFinal}' var="user">
        <tr>
            <td><c:out value="${user.name}"/></td>
            <td><c:out value="${user.email}"/></td>
            <td><c:out value="${user.address}"/></td>
            <td><a href="/users?action=edit&id=${user.id}">edit</a></td>
            <td><a href="/users?action=delete&id=${user.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
<p><a href="/users?action=sort">Sort by name</a></p>
<form action="/users?action=search" method="post">
    <fieldset>
        <legend>Search</legend>
        <input type="text" name="name" placeholder="Input a name">
        <input type="submit" value="submit">
    </fieldset>
</form>
</body>
</html>
