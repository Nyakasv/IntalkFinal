<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>Kezdőlap</title>

    </head>
    <body>
        <jsp:include page="include.jsp" />
        <%
            if (session != null) {
                if (session.getAttribute("user") != null) {
                    String name = (String) session.getAttribute("user");
                    String bubuka = session.getAttribute("bubuka").toString();
                    out.print("Hello, " + name + " jelenleg: " + bubuka + " bubukád van");
                    out.print("<form action='LogoutController' method='post'><input type='submit' value='Kijelentkezés!'></form>");
                } else {
                    out.print("<a href='login.jsp'>Jelentkezz be!</a>");
                }
            }
        %>
        <br>
        <br>
        <h2>Üdvözöllek az oldalon!</h2>
        <p>Kérlek jelentkezz be, vagy regiszrálj! Ezután válasz játékot! A tét hatalmas, le tutdod győzni a számítógépet?</p>
        <p>Fogadj a saját pénznemünkkel a Bubukával, de vigyázz ha mindet elköltötted, csak pénzért szerezhetsz újakat!</p>
        <p><a href="games.jsp">Jó játékot!</a></p>
    </body>
</html>
