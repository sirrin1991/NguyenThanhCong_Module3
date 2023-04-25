<%--
  Created by IntelliJ IDEA.
  User: Pato
  Date: 12/04/2021
  Time: 9:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Update student</h2>
    <form action="">
        <p>
            Name:
            <input type="text" name="name" value="${studentObj.name}"/>
        </p>
        <p>
            Date of birth:
            <input type="date" name="dateOfBirth" value="${studentObj.dateOfBirth}"/>
        </p>
        <p>
            <input type="submit" value="Update">
        </p>
    </form>
</body>
</html>
