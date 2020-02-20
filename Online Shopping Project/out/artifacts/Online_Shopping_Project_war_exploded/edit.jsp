<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/27/2018
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>


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

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
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
    <h3 style="text-align: center;">Edit product</h3><br>

    <table>

        <%
            String host="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/shopping";
            String user="root";
            String pass="123";
            String qry1,qry2;
            String productid=request.getParameter("id");
            String parentid="";
            System.out.println("ID  = "+productid+".......");
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection=DriverManager.getConnection(url,user,pass);
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery("select * from shopping.product where id = "+productid);

                while(resultSet.next())
                {

        %>
        <form action="/editproduct" method="post">
            <tr>
                <td>Product Name</td>
                <td><input type="text" value="<%=resultSet.getString("name")%>" name="name"</td>
            <tr/>

            <tr>
                <td>Product Price</td>
                <td><input type="text" name="price" value="<%=resultSet.getString("price")%>"></td>
            <tr/>

            <tr>
                <td>Product Details</td>
                <td><textarea name="details" type="text" value="" cols="30" rows="10"><%=resultSet.getString("details")%></textarea></td>
            </tr>

            <tr>
                <td>Email</td>
                <td><input type="text" name="email" placeholder="abc@amail.com"></td>
            </tr>

            <tr>
                <td>Pasword</td>
                <td><input type="password" name="pass"></td>
            </tr>

            <input name="productid" value="<%= productid%>" type="hidden">

            <tr>
                <td>
                    <a href="Products.jsp" style="background-color: aquamarine">Back</a>
                </td>
                <td>
                    <input type="submit" value="Edit" style="color: blueviolet; font-size: large; background-color: #ffcef4">
                </td>
            </tr>
        </form>
        <%
                    parentid=resultSet.getString("parentid");
                }
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
        %>
    </table>
</div>


<form action="login.jsp" method="post">
    <input type="submit" value="Logout" name="button">
</form>

<a href="Users.jsp">List</a>


</body>

</html>