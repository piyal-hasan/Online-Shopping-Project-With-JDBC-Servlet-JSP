<%@ page import="java.sql.*" %>

<%--
  Created by IntelliJ IDEA.
  User: hackshell
  Date: 5/25/2018
  Time: 6:01 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html>
  <head>
    <title>All Users</title>
      <style>
          body {
              background-color: rgb(182, 184, 94);
              font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
              font-size: large;
          }

          btn {
              color: rgb(65, 194, 199);
              font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
              font: icon;
          }

      </style>
  </head>

  <body>
  <table style="padding: 50px">
    <thead>
      <tr>
          <th style="padding: 15px">Name</th>
          <th style="padding: 15px">Email</th>
          <th style="padding: 15px">Phone</th>
      </tr>
    </thead>

    <tbody>


    <%
        String url = "jdbc:mysql://localhost:3306/test";
        String user = "root";
        String pass = "123";
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(url, user, pass);
        statement = connection.createStatement();
        resultSet = statement.executeQuery("select * from shopping.customer");

        int count=1;

        while (resultSet.next())
        {
    %>
        <tr align="center">
            <td><%= resultSet.getString("name") %></td>
            <td><%= resultSet.getString("email")%></td>
            <td><%= resultSet.getString("phone") %></td>
        </tr>
        <%
            }
        %>


    </tbody>
  </table>

  <a href="addcustomer.jsp">Add New Person</a>

  </body>
</html>