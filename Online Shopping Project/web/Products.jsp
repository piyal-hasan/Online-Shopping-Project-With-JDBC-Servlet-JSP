<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: tasmidur
  Date: 5/27/2019
  Time: 4:59 AM
 
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
    <a href="addproduct.jsp">Add Product</a><br>

    <table>
        <tr>
            <th>Product</th>
            <th>Price</th>
            <th>Pictutes</th>
            <th>Action1</th>
            <th>Action2</th>
        </tr>

        <%
            String host="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/shopping";
            String user="root";
            String pass="123";
            String qry1,qry2;
            try
            {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection=DriverManager.getConnection(url,user,pass);
                Statement statement=connection.createStatement();
                ResultSet resultSet=statement.executeQuery("select * from shopping.product");

                while(resultSet.next())
                {

            %>

            <tr>
                <td><%=resultSet.getString("name")%></td>
                <td><%=resultSet.getString("price")%></td>
                <td>Picture<br>Details</td>
                <td><a href="delete.jsp?id= <%= resultSet.getString("id")%> " style="background-color: #e21430">Delete</a></td>
                <td><a href="edit.jsp?id=<%= resultSet.getString("id")%>" style="background-color: #ff28be">  Edit</a> </td>
            </tr>
            <%
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
