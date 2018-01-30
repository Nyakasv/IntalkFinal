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
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author nyakasv
 */
public class CashController extends HttpServlet {

    //vissza a megfelelő .jsp oldalra
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("weneedyourmoney.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session == null) {
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            out.println("<h2><font color=red>A vásárláshoz jelentkezz be!</font></h2>");
            requestDispatcher.include(request, response);
        } else {
            int paidBubuka = Integer.parseInt(request.getParameter("bubuka"));
            String username = session.getAttribute("user").toString();

            try {
                Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk", "viktorakossanyi", "Intalk123");
                /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
               /* PreparedStatement preparedStatement = connection.prepareStatement("select bubuka from VIKTORAKOSSANYI.users where username=?");

                preparedStatement.setString(1, username);

                ResultSet resultSet = preparedStatement.executeQuery();

                int userBubuka;
                userBubuka = resultSet.getInt("bubuka");

                int newBubuka = userBubuka + paidBubuka;

                String stringBubuka = Integer.toString(newBubuka);

                preparedStatement.close();*/
                try {
                    PreparedStatement writeBubuka = connection.prepareStatement("update VIKTORAKOSSANYI.users SET bubuka =(bubuka + "+ paidBubuka+") where username=?");

                    //writeBubuka.setString(1, stringBubuka);
                    writeBubuka.setString(1, username);
                    
                    writeBubuka.executeUpdate();
                    writeBubuka.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("weneedyourmoney.jsp");
                    out.println("<h2><font color=red>Nem sikerült a vásárlás próbáld újra!</font></h2>");
                    requestDispatcher.include(request, response);
                }
                connection.close();
                
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("dolale.jsp");
                requestDispatcher.include(request, response);
            } catch (SQLException e) {
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("weneedyourmoney.jsp");
                    out.println("<h2><font color=red>Nem sikerült a vásárlás próbáld újra!</font></h2>");
                    requestDispatcher.include(request, response);
            }
        }
    }
}
