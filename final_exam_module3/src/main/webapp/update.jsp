<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script src="js/bootstrap.js"></script>
    <style>
        body {
            background-image: url("/new_folder/BG2.jpg");
            background-position: right bottom;
            background-repeat: no-repeat;
            background-size: contain;
            background-attachment: fixed;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row mt-5">
        <div class="col-12">
            <a class="btn btn-outline-primary" href="/user" role="button">Back to user page</a>
        </div>
    </div>
    <div class="row mt-2 mb-5" style="padding-left: 20px">
        <div class="col-3"></div>
        <div class="col-6">
            <div class="row">
                <input id="result" name="result" value="${result}" hidden>
                <p style="color: red"><c:if test="${mapError.get('error') != null}"/>
                    <c:out value="${mapError.get('error')}"/>
                </p>
            </div>
            <div class="row" style="background-color: lightblue">
                <form action="/user?action=update" method="post">
                    <table >
                        <tr>
                            <th colspan="2" style="text-align: center; color: #fd7e14" ><h2>UPDATE FORM</h2></th>
                        </tr>
                        <tr hidden>
                            <td><label for="id">Customer's id: </label></td>
                            <td><input type="text" id="id" name="id" value="${customer.id}" readonly>
                        </tr>
                        <tr>
                            <td><label for="cd">Customer's code: </label></td>
                            <td><input type="text" id="cd" name="code" value="${customer.customerCode}">
                                <p style="color: red"><c:if test="${mapError.get('code') != null}"/>
                                    <c:out value="${mapError.get('code')}"/>
                                </p></td>
                        </tr>
                        <tr>
                            <td><label for="fn">Customer's name: </label></td>
                            <td><input type="text" id="fn" name="name" value="${customer.name}">
                                <p style="color: red"><c:if test="${mapError.get('name') != null}"/>
                                    <c:out value="${mapError.get('name')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><label for="datepicker">Customer's birthday: </label></td>
                            <td><input id="datepicker" name="birthday" readonly value="${customer.birthday}">
                            </td>
                        </tr>

                        <tr>
                            <td><label for="gd">Customer's gender: </label></td>
                            <td>
                                <select name="gender" id="gd">
                                    <c:choose>
                                        <c:when test="${customer.gender == (true)}">
                                            <option selected value="true">Male</option>
                                            <option value="false">Female</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option selected value="false">Female</option>
                                            <option value="true">Male</option>
                                        </c:otherwise>
                                    </c:choose>
                                </select>
                            </td>
                        </tr>

                        <tr>
                            <td><label for="idc">Customer's ID card: </label></td>
                            <td><input type="text" id="idc" name="idCard" value="${customer.idCard}">
                                <p style="color: red"><c:if test="${mapError.get('card') != null}"/>
                                    <c:out value="${mapError.get('card')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><label for="pn">Customer's phone number: </label></td>
                            <td><input type="text" id="pn" name="phone" value="${customer.phone}">
                                <p style="color: red"><c:if test="${mapError.get('phone') != null}"/>
                                    <c:out value="${mapError.get('phone')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><label for="e">Customer's email: </label></td>
                            <td><input type="text" id="e" name="email" value="${customer.email}">
                                <p style="color: red"><c:if test="${mapError.get('email') != null}"/>
                                    <c:out value="${mapError.get('email')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><label for="addr">Customer's address: </label></td>
                            <td><input type="text" id="addr" name="address" value="${customer.address}">
                                <p style="color: red"><c:if test="${mapError.get('address') != null}"/>
                                    <c:out value="${mapError.get('address')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><span>Type of customer</span></td>
                            <td><select name="typeId">
                                <c:forEach var="type" items="${listType}">
                                    <c:if test="${customer.typeId==type.id}">
                                        <option value="${type.id}">${type.name}</option>
                                    </c:if>
                                </c:forEach>

                                <c:forEach var="type" items="${listType}">
                                    <c:if test="${customer.typeId != type.id}">
                                        <option value="${type.id}">${type.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="text-align: right"><input type="submit" value="Submit" class="bg-success"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="col-3"></div>
    </div>
</div>


<button id="md" hidden type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Launch demo modal
</button>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Successfully
            </div>
            <div class="modal-footer">
                <a class="btn btn-secondary" href="/customer" role="button">Back to customer page</a>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {
        $('#tableCustomer').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        } );
    } );
    $(function () {
        $("#datepicker").datepicker({
            dateFormat: 'dd-mm-yy',
            changeYear: true,
            changeMonth: true,
            yearRange: "-80:-18",
            minDate: "-80Y", maxDate: "-18Y"
        });
    });
    // if(document.getElementById("result").value === "Successfully" ){
    //     document.getElementById("md").click()
    // }

    if( ${not empty result }){
        document.getElementById("md").click()
    }


</script>
</body>
</html>