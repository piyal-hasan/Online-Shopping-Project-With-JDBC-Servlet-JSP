package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.nimbus.State;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "insert_user")
public class insert_user extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String name=request.getParameter("name");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");
        String pass1=request.getParameter("pass");
        String pass2=request.getParameter("pass1");

        int len1,len2;
        len1=pass1.length();
        len2=pass2.length();


        if(len1==len2)
        {
            for(int i=0;i<len1;i++)
                if(pass1.charAt(i)!=pass2.charAt(i))
                    response.sendRedirect("addcustomer.jsp");
        }
        else
            response.sendRedirect("addcustomer.jsp");


        //System.out.println(name+" "+email+" "+company+" "+university+" "+department+" "+batch);

        try
        {
            String host="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://localhost:3306/shopping";
            String user="root";
            String pass="123";
            String qry1,qry2;
            Connection connection=null;
            Statement statement=null;
            ResultSet resultSet=null;

            qry1="SELECT * FROM shopping.customer where email=' " + email+" ' ";

            qry2="insert into shopping.customer (name,email,phone,pass) values('"+name+"' , '"+email+"' ,'"+phone+"' ,'"+pass1+"')";

            System.out.println(qry2);

            Class.forName("com.mysql.jdbc.Driver");
            connection=DriverManager.getConnection(url,user,pass);
            statement=connection.createStatement();
            resultSet=statement.executeQuery(qry1);

            System.out.println("1st");

            int cnt=0;

            while(resultSet.next())
                cnt++;

            if(cnt>0)
                response.sendRedirect("addnew.jsp");
            else
            {
                System.out.println(qry2);
                statement.executeUpdate(qry2);
                System.out.println("Yes");
                response.sendRedirect("Users.jsp");
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            System.out.println("Sorry");
        }
    }
}
