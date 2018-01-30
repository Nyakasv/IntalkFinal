/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package calasslib;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nyakasv
 */
public class RegisterController extends HttpServlet {
    
    //vissza a megfelelő .jsp oldalra
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         request.getRequestDispatcher("regisztracio.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        String userName = request.getParameter("username");
        String password = request.getParameter("password");
        
        //input ellenőrzés
        if(userName.isEmpty() || password.isEmpty()){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("regisztracio.jsp");
            out.println("<h2><font color=red>Kérjük tötse ki a felhasználói nevet és a jelszót</font></h2>");
            requestDispatcher.include(request, response);
        }/*else if(van-e ilyen user/pw){
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("regisztracio.jsp");
            out.println("<font color=red>Már létezik ilyen felhasználó</font>");
            requestDispatcher.include(request, response);
        }
        */
        else{
            try{
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk","viktorakossanyi","Intalk123");
            String query = "insert into VIKTORAKOSSANYI.users values(?,?,10)";
            
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, password);
            preparedStatement.executeUpdate();
            
            connection.commit();
            
            preparedStatement.close();
            connection.close();
            
            }catch(SQLException e){
                e.printStackTrace();
            }/*Implementálható egy autocimmit nélküli változat is de a célnak most ez is megfelel
            kellene még egy finally block és ott bezárni a kapcsolatokat valamint rollbackre is lenen lehetőség*/
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }
        
    }


}
