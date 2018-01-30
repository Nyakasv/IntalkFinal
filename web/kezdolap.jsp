<%-- 
    Document   : kezdolap
    Created on : 2017.12.05., 13:44:39
    Author     : szsan
--%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Set up db connection
    //Fetch driver
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    
   Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk", "viktorakossanyi", "Intalk123");
    
    application.setAttribute("db", connection);
    
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Kezdőlap</title>
    </head>
    <body>
       <h1>Üdvözöllek todo</h1>
       <h2>Bubuka mennyiség:</h2>
       <h2>Mit szeretnél játszani?</h2>
       <ul>
       <li><h3><a href="kopapirollo.jsp">Kő-papír-olló</a></h3></li>
       <li><h3><a href="szamkitalalo.jsp">Számkitaláló</a></h3></li>
       </ul>
    </body>
</html>

