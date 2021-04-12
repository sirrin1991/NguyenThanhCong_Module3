<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h2>Create Customer</h2>
    <p>
        <c:if test='${requestScope["message"] != null}'>
            <span class="message">${requestScope["message"]}</span>
        </c:if>
    </p>
    <p>
        <a href="/customers">Back to customer list</a>
    </p>
    <form action="/customers?action=create" method="post">
        <fieldset>
            <legend>Customer's information:</legend>
            <input type="text" name="name" placeholder="Customer's name"><br><br>
            <input type="text" name="email" placeholder="Customer's email"><br><br>
            <input type="text" name="address" placeholder="Customer's address"><br><br>
            <input type="submit" value="Submit">
        </fieldset>
    </form>
</body>
</html>
