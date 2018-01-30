<%-- 
    Document   : regisztracio
    Created on : 2017.12.04., 21:37:38
    Author     : szsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Regisztráció</title>

    </head>
    <body>
        <jsp:include page="include.jsp" />
        <h1>Kérjük adja meg az adatait!</h1>
        <br>
        <form action="RegisterController" method="post">
            Felhasználói név: <input type="text" name="username"/><br>
            Jelszó: <input type="password" name="password"/><br>
            <input type="submit" value="Regisztráció"/>
        </form>
    </body>
</html>
