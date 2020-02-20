<%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/27/2018
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>

<head>
    <link href="style1.css" type="text/css" rel="stylesheet">
    <title>Welcome Page</title>
    <style>
        H1 {
            text-align: right;
        }

        jack {
            padding: 30px;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            font-style: normal;
        }
    </style>
    <meta charset="UTF-8">
</head>

<body>


    <H1>
        <form action="login.jsp" method="post">
            <input type="submit" value="login" name="button">
        </form>
    </H1>


    <div id="header">
        <a href="index.jsp">BD Shopping</a>
    </div>


    <div id="navbar">

        Login / Register

    </div>


    <form action="login.jsp" method="post">
        <input type="submit" value="Logout" name="button">
    </form>

    <a href="Users.jsp">List</a>
    <a href="Products.jsp">Products</a>


</body>

</html>