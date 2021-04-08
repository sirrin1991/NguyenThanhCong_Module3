<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2021
  Time: 3:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
      <style>
          body{
              background-color: cornsilk;
              font-family: Arial,sans-serif;
          }
      </style>
  </head>
  <body>
      <div class="container">
          <div class="row mt-5">
              <div class="col-12">
                  <h2 class="text-center">
                      Product Discount Calculator
                  </h2>
              </div>
          </div>
          <div class="row mt-5">
              <div class="col-12">
                  <form class="bg-info" action="/calculate" method="get">
                      <div class="form-row">
                          <div class="col-12 mt-5">
                              <input type="text" class="form-control" placeholder="Product Description" name="desc">
                          </div>
                          <div class="col-8 mt-3">
                              <input type="text" class="form-control" placeholder="List Price" name="price">
                          </div>
                          <div class="col-4 mt-3">
                              <input type="text" class="form-control" placeholder="Discount Percent" name="discount">
                          </div>
                          <div class="col-12 mt-3">
                              <button type="submit" class="btn btn-primary float-right"> Calculate Discount </button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
      </div>
  </body>
</html>
