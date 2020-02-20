package servlets;

import javax.print.DocFlavor;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "addproduct")
public class addproduct extends HttpServlet
{
    private int price;
    private int parentid;
    private String details;
    private String name;
    private String email;
    private String about;
    private String pass;
    private String pass1;

    private Connection connection;
    private ResultSet resultSet;
    private Statement statement;

    private String url = "jdbc:mysql://localhost:3306/test";
    private String user = "root";
    private String passs = "123";


    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    {
        email=request.getParameter("email");
        name=request.getParameter("name");
        price=Integer.parseInt(request.getParameter("price"));
        about=request.getParameter("details");
        pass=request.getParameter("pass");

        String sql1="select * from shopping.customer where email = '"+email+"'";

        try
        {

            if(email.length()==0 || name.length()==0 || price==0 || pass.length()==0)
                response.sendRedirect("addproduct.jsp");

            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(url,user,passs);
            statement=connection.createStatement();
            resultSet=statement.executeQuery(sql1);

            while(resultSet.next())
            {
                parentid=Integer.parseInt(resultSet.getString("id"));
                pass1=resultSet.getString("pass");
            }

            int len1,len2;

            len1=pass.length();
            len2=pass1.length();

            if(len1==len2) {
                for (int i = 0; i < len1; i++) {
                    if (pass1.charAt(i)!=pass.charAt(i))
                        response.sendRedirect("addproduct.jsp");
                }
            }
            else
                response.sendRedirect("addproduct.jsp");


            String sql2="insert into shopping.product (name, price, details, parentid) values ('"+name+"',"+price+",'"+about+"',"+parentid+")";

            statement.executeUpdate(sql2);

            System.out.println(sql2);
            response.sendRedirect("Products.jsp");

        }
        catch (Exception e)
        {
            System.out.println("Sorry");
        }
    }
}
