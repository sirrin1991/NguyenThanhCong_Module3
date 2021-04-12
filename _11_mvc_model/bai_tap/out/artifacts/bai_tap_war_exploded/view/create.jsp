<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Create Product</h2>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/products">Back to product list</a>
</p>
<form action="/products?action=create" method="post">
    <fieldset>
        <legend>Product's information:</legend>
        <input type="text" name="name" placeholder="Product's name"><br><br>
        <input type="text" name="description" placeholder="Product's description"><br><br>
        <input type="text" name="price" placeholder="Products's price"><br><br>
        <input type="submit" value="Submit">
    </fieldset>
</form>
</body>
</html>
