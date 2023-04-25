<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/08/2022
  Time: 1:59 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div class="container">
    <div class="row">
        <form>
            <input type="text" name="name" placeholder="Nhập tên">
            <input type="submit" name="action" value="search">
        </form>
    </div>
    <div class="row">
        <div class="col-lg-4"></div>
        <div class="col-lg-4"></div>
        <div class="col-lg-4 mb-3" style="text-align: right">
            <button type="button" class="btn btn-primary" id="modalcreate" data-bs-toggle="modal"
                    data-bs-target="#createmodal">
                Create modal
            </button>
            <input type="hidden" value="${map.size()}" id="mapsize">
        </div>

    </div>
    <div class="row">
        <table class="table table-hover" border="1">

            <tr>
                <th>Name</th>
                <th>Address</th>
                <th>Email</th>
                <th colspan="2" class="text-center">Action</th>
            </tr>
            <tbody>
            <c:forEach var="per" items="${list}">
                <tr>
                    <td>
                        <a href="#" data-bs-toggle="modal"
                           data-bs-target="#exampleModal1"
                           onclick="sendInfoToShow('${per.address}','${per.email}','${per.name}')">
                            <c:out value="${per.name}"/>
                        </a>
                    </td>
                    <td><c:out value="${per.address}"/></td>
                    <td><c:out value="${per.email}"/></td>
                    <td><a class="btn btn-warning" href="/person?action=showeditform&id=${per.id}">Edit</a></td>
                    <td>
                        <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                data-bs-target="#exampleModal" onclick="sendInfoToDelete('${per.id}','${per.name}')">
                            Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="row text-center text-danger">
            <div class="col-lg-12 text-center">
                ${emptyMsg}
            </div>
        </div>
    </div>
</div>

<%--Show Modal Delete--%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span class="text-danger">Are you sure to delete <span id="nameDelete"></span> ?</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="remove()">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--Show Modal Information--%>
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel1">Person Information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <span>Name: <span id="personName"></span> </span>
                <span>Address: <span id="personAddress"></span> </span>
                <span>Email: <span id="personEmail"></span> </span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<%--Notification modal--%>
<div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel1" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <h5 class="modal-title text-primary" id="exampleModalLabel2">${msg}</h5>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="changeURL()">Close
                </button>
            </div>
        </div>
    </div>
</div>

<%--Create Modal--%>

<div class="modal fade" id="createmodal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/person?action=create" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Create</h5>
                    <a href="/person?action=clear">
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </a>
                </div>
                <div class="modal-body">
                    <%--                NAME--%>
                    <div class="row">
                        <div class="col-lg-12 col-md-6 mb-3">
                            <label for="name" class="form-label">Name: </label>
                            <input type="text" class="form-control" id="name" name="name" value="${per.name}">
                        </div>
                        <%--                    check empty name--%>
                        <c:if test="${map.get('invalid_name') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('invalid_name')}"/>
                            </div>
                        </c:if>
                        <%--                    check name invalid--%>
                        <c:if test="${map.get('empty_name') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('empty_name')}"/>
                            </div>
                        </c:if>
                    </div>

                    <%--                ADDRESS--%>
                    <div class="row">
                        <div class="col-lg-12 col-md-6 mb-3">
                            <label for="address" class="form-label">Address: </label>
                            <input type="text" class="form-control" id="address" name="address" value="${per.address}">
                        </div>
                        <%--                    check empty address--%>
                        <c:if test="${map.get('empty_address') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('empty_address')}"/>
                            </div>
                        </c:if>
                    </div>

                    <%--                    EMAIL--%>
                    <div class="row">
                        <div class="col-lg-12 col-md-6 mb-3">
                            <label for="email" class="form-label">Email: </label>
                            <input type="text" class="form-control" id="email" name="email" value="${per.email}">
                        </div>
                        <%--                    check empty email--%>
                        <c:if test="${map.get('invalid_email') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('invalid_email')}"/>
                            </div>
                        </c:if>
                        <%--                    check email invalid--%>
                        <c:if test="${map.get('empty_email') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('empty_email')}"/>
                            </div>
                        </c:if>
                        <%--                    check email exist--%>
                        <c:if test="${map.get('exist_email') != null}">
                            <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                <c:out value="${map.get('exist_email')}"/>
                            </div>
                        </c:if>
                    </div>
                    <%--                Date--%>
                        <div class="row">
                            <div class="col-lg-12 col-md-6 mb-3">
                                <label for="datepicker"  class="form-label">Birthday: </label>
                                <input id="datepicker" class="form-control" name="birthday">
                            </div>
                            <%--                    check empty date--%>
                            <c:if test="${map.get('invalid_birthday') != null}">
                                <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                    <c:out value="${map.get('invalid_birthday')}"/>
                                </div>
                            </c:if>
                            <%--                    check date invalid--%>
                            <c:if test="${map.get('empty_birthday') != null}">
                                <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                    <c:out value="${map.get('empty_birthday')}"/>
                                </div>
                            </c:if>
                            <%--                    check error date--%>
                            <c:if test="${map.get('Error_date') != null}">
                                <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                    <c:out value="${map.get('Error_date')}"/>
                                </div>
                            </c:if>
                            <%--                    check error age--%>
                            <c:if test="${map.get('Error_age') != null}">
                                <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                                    <c:out value="${map.get('Error_age')}"/>
                                </div>
                            </c:if>
                        </div>
                <div class="modal-footer">
                    <a href="/person?action=clear" id="close" class="btn btn-secondary" role="button">Close</a>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </div>
        </form>
    </div>
</div>


<form id="formDelete">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="idPerson"/>
</form>

<button type="button" hidden class="btn btn-danger" data-bs-toggle="modal" id="tet"
        data-bs-target="#exampleModal2">
</button>
</body>
<script>
    $(function () {
        $("#datepicker").datepicker({
            dateFormat: 'dd-mm-yy',
            changeYear: true,
            changeMonth: true,
            yearRange: "-80:-18",
            minDate: "-80Y", maxDate: "-18Y"
        });
    });

    function sendInfoToDelete(id, name) {
        document.getElementById("nameDelete").innerText = name;
        document.getElementById("idPerson").value = id;
    }

    function sendInfoToShow(address, email, name) {
        document.getElementById("personName").innerText = name;
        document.getElementById("personEmail").innerText = email;
        document.getElementById("personAddress").innerText = address;
    }

    function remove() {
        document.getElementById("formDelete").submit();
    }

    function doSth() {
        let any = document.getElementById("exampleModalLabel2").textContent;
        if (any) {
            document.getElementById("tet").click();
            changeURL();
        }
    }

    (function openModalCreate() {
        let any = document.getElementById("mapsize").value;
        console.log(any);
        if (any > 0) {
            console.log(any)
            document.getElementById("modalcreate").click();
        }
    })();

    doSth();

    function changeURL() {
        window.history.replaceState("", "", "/person");
    }


</script>
</html>
