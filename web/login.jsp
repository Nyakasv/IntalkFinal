<%-- 
    Document   : login
    Created on : 2017.12.04., 22:56:52
    Author     : szsan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bejelentkezés</title>

    </head>
    <body>
<jsp:include page="include.jsp" />
        <form action="LoginController" method="post">
            Felhasználói név: <input type="text" name="username"/><br>
            Jelszó: <input type="password" name="password"/><br>
            <input type="submit" value="Bejelentkezés"/>
        </form>
        <h3>Amennyiben még nem regisztrált irány a: <a href="regisztracio.jsp">Regisztráció</a>!</h3>
    </body>
</html>
