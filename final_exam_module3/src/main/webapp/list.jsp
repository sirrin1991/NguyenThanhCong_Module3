<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Final Exam</title>

    <link rel="stylesheet" href="css/bootstrap.css"/>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="jquery-3.6.0.min.js"></script>
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
    <div class="row">
        <div class="col-12 mt-3 bg-white">
            <form action="/product?action=search" method="post" >
                <input type="text" id="searchName" name="name" placeholder="Name">
                <input type="text" id="searchPrice" name="price" placeholder="Price">
                <input type="submit" role="button" class="btn-primary" value="Search">
            </form>
        </div>
    </div>
    <div class="row mt-3">
        <div class="col-4">
            <a class="btn btn-primary" href="/product?action=create" role="button">Create new product</a>
        </div>
        <div class="col-4 ">
            <a class="btn btn-primary" href="/home" role="button">Back to home page</a>
        </div>
        <div class="col-4"></div>
    </div>
    <div class="row mt-3">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped table-bordered"
                   style="background-color: white ;width:100%; font-size: small">
                <thead>
                <tr>
                    <th>#</th>
                    <th hidden>Id</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Color</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="list" items="${list}" varStatus="loop">
                    <tr>
                        <td><c:out value="${loop.count}"/></td>
                        <td hidden><c:out value="${list.id}"/></td>
                        <td><c:out value="${list.name}"/></td>
                        <td><c:out value="${list.price}"/></td>
                        <td><c:out value="${list.quantity}"/></td>
                        <td><c:out value="${list.color}"/></td>
                        <td><c:out value="${list.description}"/></td>
                        <td><c:out value="${list.categoryName}"/></td>
                        <td><a class="btn btn-warning" href="/product?action=update&id=${list.id}" role="button">Update</a>
                        </td>
                        <td><a class="btn btn-danger"
                               href="/product?action=delete&id=${list.id}&name=${list.name}" role="button"
                               data-toggle="modal" data-target="#exampleModal"
                               onclick="setIdDeleteToForm('${list.id}','${list.name}')">Delete</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

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
                <span>Are you sure to delete </span>
                <input style="border: none;color: red" type="text" name="name" id="nameDelete" readonly>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitFormDelete()">Save changes</button>
            </div>
        </div>
    </div>
</div>

<form action="/product" id="formDelete">
    <input type="hidden" name="action" value="delete"/>
    <input type="hidden" name="id" id="idCustomer"/>
</form>

<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 4
        });
    });

    function setIdDeleteToForm(idCustomer, nameDelete) {
        document.getElementById("idCustomer").value = idCustomer;
        document.getElementById("nameDelete").value = nameDelete;
    }

    function submitFormDelete() {
        document.getElementById("formDelete").submit();
    }

    <%--if(${msg != null}){document.getElementById("abc").click();}--%>
</script>
</body>
</html>
