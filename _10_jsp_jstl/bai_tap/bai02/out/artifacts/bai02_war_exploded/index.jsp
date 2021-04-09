<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/9/2021
  Time: 4:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <link rel="stylesheet" href="lib/css/bootstrap.css">
    <script src="lib/jquery-3.6.0.min.js"></script>
    <script src="lib/js/bootstrap.js"></script>
    <style>
        body {
            background-color: lightgray;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-6">
            <form action="/calculation" class="text-primary">
                <div class="row">
                    <div class="form-group">
                        <label for="num1">Number 1</label>
                        <input type="number" class="form-control" id="num1" name="number1">
                    </div>
                </div>
                <div class="row">
                    <select name="cal">
                        <option value="sum">+</option>
                        <option value="sub">-</option>
                        <option value="mul">*</option>
                        <option value="div">/</option>
                    </select>
                </div>
                <div class="row mt-2">
                    <div class="form-group">
                        <label for="num2">Number 2</label>
                        <input type="number" class="form-control" id="num2" name="number2">
                    </div>
                </div>

                <div>
                    <button class="btn btn-primary" type="submit">Get result</button>
                </div>

            </form>
        </div>
    </div>
</div>
</body>
</html>
