<%-- 
    Document   : user
    Created on : 2017.12.05., 10:39:32
    Author     : hakos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Felhasználó</title>

    </head>
    <body>
<jsp:include page="include.jsp" />
        <%
            if (session != null) {
                if (session.getAttribute("user") != null) {
                    String name = (String) session.getAttribute("user");
                    String bubuka = session.getAttribute("bubuka").toString();
                    out.print("<br>");
                    out.print("Hello, " + name + " jelenleg: " + bubuka + " bubukád van!");
                    out.print("<br>");
                    out.print("<br>");
                    out.print("<form action='UserController' method='post'><table ><tbody><tr><td>Új jelszó</td><td> <input type='text' name='newpassword'/></td></tr></tbody></table><input type='submit' value='Megváltoztat'></form>");
                } else {
                    out.print("<a href='login.jsp'>Jelentkezz be!</a>");
                }
            }
        %>

    </body>
</html>
