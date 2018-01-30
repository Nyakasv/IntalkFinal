<%-- 
    Document   : szamkitalalo
    Created on : 2017.12.05., 15:30:34
    Author     : szsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Random" %>
<%@page import="java.sql.*" %>
<%
Class.forName("org.apache.derby.jdbc.ClientDriver");
Connection connection = DriverManager.getConnection("jdbc:derby://localhost:1527/intalk", "viktorakossanyi", "Intalk123");
application.setAttribute("db", connection);
                    
               
                    String name = (String) session.getAttribute("user");
                    String bubuka = session.getAttribute("bubuka").toString();
          
                    
%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <jsp:include page="include.jsp" />
        <table border="1px">
         <tr>
          <td><%=name%></td>
          <td><%=bubuka%> bubuka</td> 
        </tr>
       </table>
        <p>Ez egy számkitaláló játék, ahol a feltett pézt meg 10x-ezheted, vagy elbukhatod!</p>
        <a href="index.jsp">vissza a főoldalra</a>
        <form action="szamkitalalo.jsp" method="POST">
       <p>Adja meg mennyi bubukát szeretne feltenni!<br>
           <input type="number" name="tet" value="1" min="1" max="<%=bubuka%>"></p>
       <p>tippeljen 1 és 10 között:<br>
       <input type="number" name="tipp" value="1" min="1" max="10">
       </p>
       <input type="submit" value="Tippelek!">
       </form>
       <%
           String er="";
       if(request.getParameter("tipp") != null){
           Random r = new Random();
            int Low = 1;
            int High = 11;
            int Result = r.nextInt(High-Low) + Low;  
       
           if(Result== Integer.parseInt(request.getParameter("tipp"))){
               er="Gratulálok nyertél!";
               String query = "update users SET bubuka = bubuka+10*? where username=?";
            
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, request.getParameter("tet"));
            preparedStatement.setString(2, name);
            preparedStatement.executeUpdate();
            
            connection.commit();
            
            preparedStatement.close();
               
           }else{
              er="Sajnos vesztettél!";
              
              String query = "update users SET bubuka = bubuka-? where username=?";
            
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, request.getParameter("tet"));
            preparedStatement.setString(2, name);
            preparedStatement.executeUpdate();
            
            connection.commit();
            
            preparedStatement.close();
           }
         %>
        <h1><%=er%></h1>
       <p>A gép választása: <%=Result %></p>
        <% 
       }

            /*sessiont kéne még updatelni*/
            PreparedStatement preparedStatement = connection.prepareStatement("select username,password,bubuka from users where username=? ");
            preparedStatement.setString(1, name);
            ResultSet resultSet = preparedStatement.executeQuery();
            
            while (resultSet.next()) {

                int bubuka2 =resultSet.getInt("BUBUKA");
                session.setAttribute("bubuka", bubuka2);
            }  

            preparedStatement.close();
       %>
       
    </body>
</html>
