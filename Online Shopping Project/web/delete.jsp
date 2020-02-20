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
            <a href="index.jsp">BD Shopping<br></a>
        </div>

        <%
            String id = request.getParameter("id");
            System.out.println("Id = "+id+" In delte");
        %>


        <div id="navbar">
            <h3 style="color: blueviolet; text-align: center">Are U Sure to Delete<br>So Please Enter Email and Password</h3>
            <form method="post" action="" style="text-align: center">
                <input type="text" name="email" placeholder="Email"><br>
                <input type="password" name="pass" placeholder="Password"><br>
                <input type="submit" value="Delete">
            </form>
        </div>


        <form action="login.jsp" method="post">
            <input type="submit" value="Logout" name="button">
        </form>

        <a href="Users.jsp">List</a>


    </body>

</html>

<%
    String useremail=request.getParameter("email");
    String userpass=request.getParameter("pass");
    String parentemail="";
    String parentpass="";

    String host="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/shopping";
    String user="root";
    String pass="123";
    String qry1,qry2;

    System.out.println("Atleast Baire");
    int parentid=0,productid=0;

    try {
        System.out.println("In try delete");
        if(userpass.length()==0)
            response.sendRedirect("delete.jsp");
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection(url, user, pass);
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery("select * from shopping.product where id=" + id);

        while(resultSet.next())
        {
            parentid=resultSet.getInt("parentid");
            productid=resultSet.getInt("id");
        }

        qry1="select * from shopping.customer where id="+parentid;
        Connection connection1=DriverManager.getConnection(url,user,pass);
        Statement statement1=connection1.createStatement();
        ResultSet resultSet1=statement.executeQuery(qry1);

        //System.out.println("Yes");

        while(resultSet1.next())
        {
            parentemail=resultSet1.getString("email");
            parentpass=resultSet1.getString("pass");
        }

        System.out.println("Usr rmail = "+useremail+" Pass = "+userpass+" Parent email = "+parentemail+" Parentpass = "+parentpass+" in delete");


        int passlen1=userpass.length();
        int passlen2=parentpass.length();

        int maillen1=useremail.length();
        int maillen2=parentemail.length();

        if(passlen1!=passlen2 || maillen1!=maillen2)
            response.sendRedirect("delete.jsp?id=3");
        for(int i=0;i<passlen1;i++)
        {
            if(userpass.charAt(i)!=parentpass.charAt(i))
                response.sendRedirect("delete.jsp?id=3");
        }
        for(int i=0;i<maillen1;i++)
        {
            if(useremail.charAt(i)!=parentemail.charAt(i))
                response.sendRedirect("delete.jsp?id=3");
        }

        qry2="delete from shopping.product where id="+id;
        System.out.println("Qry = "+qry2);
        statement1.executeUpdate(qry2);
        System.out.println("Yes");
        response.sendRedirect("Products.jsp");

    }
    catch (Exception e)
    {
        System.out.println("Sorry");
    }

%>
