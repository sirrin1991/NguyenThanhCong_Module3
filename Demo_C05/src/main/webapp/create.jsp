<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 26/08/2022
  Time: 9:43 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <form action="/person?action=create" method="post">
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
                </div>

                <%--                    DATE--%>
                <div class="row">
                    <div class="col-lg-12 col-md-6 mb-3">
                        <label for="datepicker"  class="form-label">Birthday: </label>
                        <input id="datepicker" name="birthday">
                    </div>
                    <%--                    check DATE email--%>
                    <c:if test="${map.get('invalid_birthday') != null}">
                        <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                            <c:out value="${map.get('invalid_birthday')}"/>
                        </div>
                    </c:if>
                    <%--                    check DATE invalid--%>
                    <c:if test="${map.get('empty_birthday') != null}">
                        <div class="col-lg-12 col-md-6 mb-3 alert alert-danger" role="alert">
                            <c:out value="${map.get('empty_birthday')}"/>
                        </div>
                    </c:if>
                </div>
                <%--                <select name="select" onchange="showDiv(this.value)">--%>
                <%--                    <option value="">Chọn ở đây</option>--%>
                <%--                    <option value="div1">House</option>--%>
                <%--                    <option value="div2">Room</option>--%>
                <%--                </select>--%>
                <%--                <div id="div1" style="display: none">--%>
                <%--                    <input type="text" placeholder="div1" class="input1" name="div1" id="input1" >--%>
                <%--                </div>--%>
                <%--                <div id="div2" style="display: none">--%>
                <%--                    <input type="text" placeholder="div2" class="input2" name="div2" id="input2" >--%>
                <%--                </div>--%>
                <div class="row" style="float: right">
                    <input type="submit" role="button" class="btn btn-primary" value="Submit">
                </div>
            </form>

        </div>

    </div>
</div>
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
    // function showDiv(value) {
    //     if (value === "div1") {
    //         document.getElementById("div1").style.display = "block";
    //         document.getElementById("div2").style.display = 'none';
    //     } else if (value === "div2") {
    //         document.getElementById("div2").style.display = "block";
    //         document.getElementById("div1").style.display = "none";
    //     }else if(value ==="") {
    //         document.getElementById("div1").style.display = "none";
    //         document.getElementById("div2").style.display = "none";
    //     }
    // }
    function changeURL() {
        window.history.replaceState("Create", "Create", "/person?action=showcreateform");
    }

    window.onload(changeURL());
</script>
</html>
