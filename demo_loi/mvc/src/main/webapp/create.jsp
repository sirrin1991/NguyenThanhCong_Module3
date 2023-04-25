
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<button><a href="/product">Back</a></button>
<form action="/product?action=create" method="post">
    <label for="name">Name:</label>
    <input type="text" id="name" name="name">

        <td><label for="datepicker">Customer's birthday: </label></td>
        <td><input id="datepicker" name="birthday" readonly >
        </td>

    <input type="submit" value="Create">
</form>

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
</script>
</html>
