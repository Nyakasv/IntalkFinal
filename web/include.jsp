<%-- 
    Document   : include
    Created on : 2017.12.05., 14:41:51
    Author     : kisny
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            body {margin: 0;}

            ul.topnav {
                list-style-type: none;
                margin: 0;
                padding: 0;
                overflow: hidden;
                background-color: #333;
            }

            ul.topnav li {float: left;}

            ul.topnav li a {
                display: block;
                color: white;
                text-align: center;
                padding: 14px 16px;
                text-decoration: none;
            }

            ul.topnav li a:hover:not(.active) {background-color: #111;}

            ul.topnav li a.active {background-color: #4CAF50;}

            ul.topnav li.right {float: right;}

            @media screen and (max-width: 600px){
                ul.topnav li.right, 
                ul.topnav li {float: none;}
            }
        </style>
    </head>
    <body>
        
        <ul class="topnav">
            <li><a class="active" href="index.jsp">Kezdőlap</a></li>
            <li><a href="login.jsp">Bejelentkezés</a></li>
            <li><a href="regisztracio.jsp">Regisztráció</a></li>
            <li><a href="weneedyourmoney.jsp">Vásárlás</a></li>
            <li><a href="games.jsp">Játékok</a></li>
            <li class="right"><a href="user.jsp">Felhasználó</a></li>
        </ul>
    </body>
</html>
