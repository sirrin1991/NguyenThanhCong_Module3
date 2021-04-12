<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>PRODUCT</h1>
<p>
    <a href="/products?action=create">Create new Product</a>
</p>
<table border="1px" style="border-collapse: collapse">
    <tr>
        <th>Name</th>
        <th>Description</th>
        <th>Price</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    <c:forEach items='${productList}' var="product">
        <tr>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.description}"/></td>
            <td><c:out value="${product.price}"/></td>
            <td><a href="/products?action=edit&id=${product.id}">edit</a></td>
            <td><a href="/products?action=delete&id=${product.id}">delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>

