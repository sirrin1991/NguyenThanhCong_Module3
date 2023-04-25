<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
    <h2 class="color-blue">List student by JSTL</h2>
    <h2 style="color: red">${msgServlet}</h2>
    <form action="/student">
        <input type="hidden" name="actionClient" value="search" />
        <input type="text" name="keyword" value="${keywordJSP}"/>
        <input type="submit" value="Search" />
    </form>
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
                <td><a href="#" data-toggle="modal" data-target="#exampleModal" onclick="setIdDeleteToForm('${student.id}')">Delete</a></td>
            </tr>
        </c:forEach>
    </table>

    <!-- Button trigger modal -->
<%--    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">--%>
<%--        Launch demo modal--%>
<%--    </button>--%>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Confirm xoá</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Bạn có muốn xoá học viên này không?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onclick="submitFormDelete()">Save changes</button>
                </div>
            </div>
        </div>
    </div>

    <form action="/student" id="formDelete">
        <input type="hidden" name="actionClient" value="delete" />
        <input  type="hidden" name="id" id="idStudentDelete" />
        <input  type="hidden" name="name" id="nameStudentDelete" />
    </form>

    <script src="js/jquery-3.6.0.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        function setIdDeleteToForm(idStudent) {
            document.getElementById("idStudentDelete").value = idStudent;
        }

        function submitFormDelete() {
            document.getElementById("formDelete").submit();
        }
    </script>
</body>
</html>
