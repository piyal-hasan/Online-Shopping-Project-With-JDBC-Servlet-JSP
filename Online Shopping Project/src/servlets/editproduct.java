package servlets;

import com.sun.xml.internal.ws.server.DefaultResourceInjector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet(name = "editproduct")
public class editproduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String name=request.getParameter("name");
        String price=request.getParameter("price");
        String details=request.getParameter("details");
        String productid=request.getParameter("productid");


        String useremail=request.getParameter("email");
        String userpass=request.getParameter("pass");

        System.out.println(name+price+details+useremail+userpass+productid);


        String parentemail="",parentpass="",parentid="";


        String host="com.mysql.jdbc.Driver";
        String url="jdbc:mysql://localhost:3306/shopping";
        String user="root";
        String pass="123";
        String qry1="",qry2="";

        try
        {
            Class.forName(host);
            Connection connection=DriverManager.getConnection(url,user,pass);
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery("select * from shopping.product where id="+productid);

            qry1="update shopping.product set name='"+name+"',price="+price+",details='"+details+"' where id="+productid;

            while(resultSet.next()) {
                parentid = resultSet.getString("parentid");
            }

            Statement statement1=connection.createStatement();

            System.out.println("Yessssss");
            ResultSet resultSet1=statement1.executeQuery("select * from shopping.customer where id="+parentid);
            while(resultSet1.next())
            {
                parentemail=resultSet1.getString("email");
                parentpass=resultSet1.getString("pass");
            }


            int len1,len2,len3,len4;

            len1=useremail.length();
            len2=parentemail.length();

            len3=userpass.length();
            len4=parentpass.length();


            if(len1==0 || len2==0 || len3==0 || len4==0)
                response.sendRedirect("edit.jsp?id="+productid);

            if(len1!=len2 || len3!=len4)
                response.sendRedirect("edit.jsp?id="+productid);

        }
        catch (Exception e)
        {
            System.out.println("Sorry");
        }
    }
}
