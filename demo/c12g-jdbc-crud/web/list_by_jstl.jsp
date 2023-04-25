<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
</head>
<body>
    <h2>List student by JSTL</h2>
    <table border="1">
        <tr>
            <th>No</th>
            <th>Id</th>
            <th>Name</th>
            <th>Date of birth</th>
            <th>Gender</th>
            <th>Degree</th>
            <th colspan="2">Action</th>
        </tr>
<%--        for (Student student : studentListJSP) {--%>
        <c:forEach var="student" items="${studentListServlet}" varStatus="loop">
            <tr>
                <td>${loop.index + 1}</td>
                <td>${student.id}</td>
                <td><c:out value="${student.name}"/></td>
                <td>
                        ${student.dateOfBirth}
<%--                    <c:out value="${student.dateOfBirth}"></c:out>--%>
                </td>
                <td>
                    <c:if test="${student.gender == 1}">
                        Male
                    </c:if>
                    <c:if test="${student.gender == 0}">
                        Female
                    </c:if>
                </td>
                <td>
                    <c:choose>
                        <c:when test="${student.grade <= 4}">
                            Bad
                        </c:when>
                        <c:when test="${student.grade <= 7}">
                            Good
                        </c:when>
                        <c:otherwise>
                            Very good
                        </c:otherwise>
                    </c:choose>
                </td>
                <td><a href="/student?actionClient=update&id=${student.id}">Update</a></td>
                <td><a href="/studentDelete?actionClient=delete&id=${student.id}">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
