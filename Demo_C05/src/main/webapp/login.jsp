<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 03/09/2022
  Time: 1:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <style>
        body{
            background-image: url("/img/nature-full-hd-image-1920x1080-wallpaper-preview.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
<%--<form action="/login" method="post">--%>
<%--    <input type="text" name="user_name" >--%>
<%--    <input type="text" name="password" >--%>
<%--    <input type="checkbox" name="ck" checked> Remember me--%>
<%--    <input type="submit" value="Login">--%>
<%--</form>--%>


<%--Form login--%>
<div class="container-fluid">
    <div class="row mt-5">
        <div class="col-3"></div>
        <div class="col-6">
            <form  action="/login" method="post">
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label" style="color: white">User name:</label>
                    <input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="user_name">
                    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label" style="color: white">Password</label>
                    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1">
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>
                <button type="submit" class="btn btn-primary">log in</button>
            </form>
        </div>
        <div class="col-3"></div>
    </div>
</div>
<div class="alert-danger" role="alert">${msg}
</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
