/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calasslib;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author hakos
 */
public class UserController extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("user.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if(request.getParameter("newpassword")!=null){
            
            HttpSession session = request.getSession();
            String username;
            username = session.getAttribute("user").toString();
            String newpassword = request.getParameter("newpassword");
            
            try{
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk","viktorakossanyi","Intalk123");
            
            PreparedStatement passwordChange = connection.prepareStatement("update VIKTORAKOSSANYI.users SET password = ? where username=?");
            
            passwordChange.setString(1, newpassword);
            passwordChange.setString(2, username);
            
            passwordChange.executeUpdate();
            passwordChange.close();
            connection.close();
            
                                response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user.jsp");
                    out.println("<h2><font color=red>Siker!</font></h2>");
                    requestDispatcher.include(request, response);
            }catch(SQLException e){
                e.printStackTrace();
                   response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user.jsp");
                    out.print("<h2><font color=red>Nem sikerült a jelszó megváltoztatása, próbáld újra!</font></h2>");
                    requestDispatcher.include(request, response);
            }
            
        }else{
            response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("user.jsp");
                    out.print("<h2><font color=red>Az új jelszó mező üres töltsd ki!</font></h2>");
                    requestDispatcher.include(request, response);
        }
    }
}
