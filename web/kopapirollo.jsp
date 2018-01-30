<%-- 
    Document   : kopapirollo
    Created on : 2017.12.04., 20:16:34
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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>KPO</title>

    </head>
    <body>
        <jsp:include page="include.jsp" />
        <table border="1px">
         <tr>
          <td><%=name%></td>
          <td><%=bubuka%> bubuka</td> 
        </tr>
       </table>
        <p>Ez egy kő-papir-olló játék, ahol pénzt nyerhetsz, illetve veszíthetsz!</p>
        <a href="index.jsp">vissza a főoldalra</a>
       <form action="kopapirollo.jsp" method="POST">
       <p>Adja meg mennyi bubukát szeretne feltenni!<br>
           <input type="number" name="tet" value="1" min="1" max="<%=bubuka%>"></p>
       <p>következők közül választhat:<br>
           <select name="kpo">
                <option value="ko">Kő</option>
                <option value="papir">Papír</option>
                <option value="ollo">Olló</option>
           </select>
       </p>
       <input type="submit" value="Induljon!">
       </form>
       <%
           if(request.getParameter("kpo")!=null){
       
        Random r = new Random();
            int Low = 1;
            int High = 4;
            int Result = r.nextInt(High-Low) + Low;
            String ellenfel;
            switch (Result) {
            case 1:  ellenfel="ko";
                     break;
            case 2:  ellenfel ="papir";
                     break;
            default: ellenfel = "ollo";
                     break;
            }
       %>
        <table border="1px">
         <tr>
          <td>A te választásod:</td>
          <td>Az ellenfeled választása:</td> 
        </tr>
        <tr>
            <td><img src="kpo/<%=request.getParameter("kpo")%>.jpg"></td>
            <td><img src="kpo/<%=ellenfel%>.jpg"></td> 
        </tr>
        
       </table>
       <%
        String eredmeny;
        if(request.getParameter("kpo").equals(ellenfel)){
            eredmeny="dontetlen";
        }else if(
            (request.getParameter("kpo").equals("ko") && ellenfel.equals("ollo"))|| 
            (request.getParameter("kpo").equals("papir") && ellenfel.equals("ko"))||
            (request.getParameter("kpo").equals("ollo") && ellenfel.equals("papir"))){
            eredmeny="nyertel";
        }else{
            eredmeny="vesztettel";
        }
        if(eredmeny.equals("nyertel")){
          
             String query = "update users SET bubuka = bubuka+? where username=?";
            
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, request.getParameter("tet"));
            preparedStatement.setString(2, name);
            preparedStatement.executeUpdate();
            
            connection.commit();
            
            preparedStatement.close();
            %>
            <p>Gratulálok nyertél!</p>
            <%
            
        } 
        else if(eredmeny.equals("vesztettel")){

             String query = "update users SET bubuka = bubuka-? where username=?";
            
            /*https://docs.oracle.com/javase/tutorial/jdbc/basics/prepared.html*/
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, request.getParameter("tet"));
            preparedStatement.setString(2, name);
            preparedStatement.executeUpdate();
            
            connection.commit();
            
            preparedStatement.close();
            %>
            <p>Sajnálom vesztettél.</p>
            <%
        }else{
            %><p>Ez most döntetlen!</p><%
        }

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
