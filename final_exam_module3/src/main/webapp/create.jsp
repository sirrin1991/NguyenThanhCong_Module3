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
    <div class="row mt-3">
        <div class="col-12">
            <a class="btn btn-outline-primary" href="/product" role="button">Back to product page</a>
        </div>
    </div>
    <div class="row mt-3" style="padding-left: 20px">
        <div class="col-3"></div>
        <div class="col-6">

            <div class="row">
                <div class="col-12">
                <p style="color: red">${result}</p>
                <p style="color: red"><c:if test="${mapError.get('error') != null}"/>
                    <c:out value="${mapError.get('error')}"/>
                </p>
                </div>
            </div>
            <div class="row" style="background-color: lightblue">
                <div class="col-12">
                <form action="/product?action=create" method="post">
                    <table class="ml-2">
                        <tr>
                            <th colspan="2" style="text-align: center; color: chocolate"><h2>CREATE FORM</h2></th>
                        </tr>
                        <tr>
                            <td><label for="fn">Product's name: </label></td>
                            <td><input type="text" id="fn" name="name" value="${product.name}">
                                <p style="color: red"><c:if test="${mapError.get('name') != null}"/>
                                    <c:out value="${mapError.get('name')}"/>
                                </p></td>
                        </tr>
                        <tr>
                            <td><label for="pr">Product's price: </label></td>
                            <td><input type="text" id="pr" name="price" value="${product.price}">
                                <p style="color: red"><c:if test="${mapError.get('price') != null}"/>
                                    <c:out value="${mapError.get('price')}"/>
                                </p></td>
                        </tr>
                        <tr>
                            <td><label for="quantity">Product's quantity: </label></td>
                            <td><input type="text" id="quantity" name="quantity" value="${product.quantity}">
                                <p style="color: red"><c:if test="${mapError.get('quantity') != null}"/>
                                    <c:out value="${mapError.get('quantity')}"/>
                                </p></td>
                        </tr>

                        <tr>
                            <td><label for="description">Product's description: </label></td>
                            <td><input type="text" id="description" name="description" value="${product.description}">
                                <p style="color: red"><c:if test="${mapError.get('name') != null}"/>
                                    <c:out value="${mapError.get('name')}"/>
                                </p></td>
                        </tr>


                        <tr>
                            <td><label for="color">Product's color: </label></td>
                            <td>
                                <select name="color" id="color">
                                    <option value="red">Red</option>
                                    <option value="green">Green</option>
                                    <option value="black">Black</option>
                                    <option value="white">White</option>
                                    <option value="yellow">Yellow</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td><span>Category</span></td>
                            <td><select name="categoryId">
                                <c:forEach var="type" items="${list}">
                                <option value="${type.id}">${type.name}</option>
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
        </div>
        <div class="col-3"></div>
    </div>
</div>
</body>
</html>