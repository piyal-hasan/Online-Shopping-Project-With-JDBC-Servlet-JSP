<%--
  Created by IntelliJ IDEA.
  User: tasmidur
  Date: 5/27/2019
  Time: 5:01 AM
 
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@page import="java.sql.*" %>


<html>
    <head>
        <title>Register</title>
        <style>
            body {
                background-color: rgb(168, 184, 160);
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
            <h1 style="background-color: blueviolet; text-align: center">Sign Up</h1>
            <section>
                <form action="/insert_user" method="post" style="text-align: center">
                    <input type="text" name="name" placeholder="Name"></br>
                    <input type="text" name="email" placeholder="Email"></br>
                    <input type="text" name="phone" placeholder="Phone"></br>
                    <input type="password" name="pass" placeholder="Password"><br>
                    <input type="password" name="pass1" placeholder="Retype-Password"><br>
                    <input type="submit" value="Register">
                    <a href="index - Copy.jsp" style="background-color: #e21430" aria-live="assertive">Back to List</a>
                </form>
            </section>
        </body>
</html>
