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
import javax.servlet.http.HttpSession;

/**
 *
 * @author nyakasv
 */
public class LoginController extends HttpServlet {

    //vissza a megfelelő .jsp oldalra
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try {
            Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk", "viktorakossanyi", "Intalk123");
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement("select username,password,bubuka from VIKTORAKOSSANYI.users where username=? and password=?");

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                //kapcsolatok bezárása
                int bubuka =resultSet.getInt("BUBUKA");
                preparedStatement.close();
                connection.close();

                HttpSession session = request.getSession(true);
                session.setAttribute("user", username);
                session.setAttribute("bubuka", bubuka);
                session.setMaxInactiveInterval(60 * 5);
                response.sendRedirect("index.jsp");
                return;
            }
            //kapcsolatok bezárása
            preparedStatement.close();
            connection.close();
            
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("login.jsp");
            out.println("<h2><font color=red>Érvénytelen felhasználói név vagy jelszó</font></h2>");
            requestDispatcher.include(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
