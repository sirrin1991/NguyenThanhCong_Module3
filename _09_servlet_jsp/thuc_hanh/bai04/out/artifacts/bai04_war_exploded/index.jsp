<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 4/8/2021
  Time: 2:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Dictionary</title>
  </head>
  <body>
  <h1>Vietnamese Dictionary</h1>
  <form action="/translate" method="get">
      <input type="text" name="word">
      <input type="submit" value="Search">
  </form>
  </body>
</html>
