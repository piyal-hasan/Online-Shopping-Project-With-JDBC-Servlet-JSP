<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>

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
            H1
            {
                text-align: right;
            }

            jack
            {
                padding: 30px;
                font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
                font-style: normal;
            }
        </style>
        <meta charset="UTF-8">
    </head>
    <body>


    <div id="header">
        <a href="index.jsp">Atiq's Page</a>
    </div>
    <div id="navbar">
        <form method="post" action="" style="text-align: center">
            <input type="text" name="email" placeholder="Email"><br>
            <input type="password" name="pass" placeholder="Password"><br>
            <input type="submit" value="Login">
        </form>

    </div>
    </body>

</html>

<%
    String host="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/test";
    String user="root";
    String pass="123";
    String qry1,qry2;

    String eml=request.getParameter("email");
    String pss=request.getParameter("pass");

    qry1="select * from test.students where email = ' "+eml+" ' ";

    System.out.println(qry1);

    try
    {
        Class.forName(host);
        Connection connection=DriverManager.getConnection(url,user,pass);
        Statement statement=connection.createStatement();
        ResultSet resultSet=statement.executeQuery(qry1);

        String pss1="";

        while(resultSet.next())
            pss1=resultSet.getString("pass");

        System.out.println("Pass = "+pss+" Pass = "+pss1);

        if(pss1.length()==pss.length())
        {
            for(int i=0;i<pss.length();i++)
            {
                if(pss1.charAt(i)!=pss.charAt(i))
                    response.sendRedirect("login.jsp");
            }
            response.sendRedirect("index - Copy.jsp");
        }
        else
            response.sendRedirect("login.jsp");
    }
    catch (Exception e)
    {
        System.out.println("Sorry");
    }
%>