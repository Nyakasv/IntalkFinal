<%-- 
    Document   : games
    Created on : 2017.12.05., 16:32:28
    Author     : kisny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Games</title>
    </head>
    <body>
        <jsp:include page="include.jsp" />
        <%
            
            if (session != null){
                out.print("<h2>Mit szeretnél játszani?</h2><ul><li><h3><a href='kopapirollo.jsp'>Kő-papír-olló</a></h3></li><li><h3><a href='szamkitalalo.jsp'>Számkitaláló</a></h3></li></ul>");
                
            }else{
                
                out.print("<h2>Kérlek jelentkezz be!</h2>");
                }
            %>
        
        
        
                
    </body>
</html>
