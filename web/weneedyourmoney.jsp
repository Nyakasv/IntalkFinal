<%-- 
    Document   : weneedyourmoney
    Created on : 2017.12.04., 23:26:40
    Author     : hakos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bubuka vásárlás</title>

    <body>
<jsp:include page="include.jsp" />
        <h1>Kimerült a pénzforrásod? Itt pótolhatod vásárolj bubukát!</h1>
        <form action="CashController" method="post">
            Mennyi Bubukát szeretnél vásárolni?<br>
            <input type="radio" name="bubuka" value="10"> 10 Bubuka 999 Ft<br>
            <input type="radio" name="bubuka" value="50"> 50 Bubuka 4499 Ft<br>
            <input type="radio" name="bubuka" value="100" checked> 100 Bubuka 8199 Ft (Legjobb ár/érték)
            <br>
            <br>
            <table >
                    <tbody>
                            <tr>
                                    <td>Bankkártyaszám</td>
                                    <td> <input type="text" name="craditcardnumber"/></td>
                            </tr>
                            <tr>
                                    <td> Kártyára írt név</td>
                                    <td> <input type="text" name="craditcardname"/></td>
                            </tr>
                            <tr>
                                    <td> Lejárati dátum (HH/ÉÉ)</td>
                                    <td> <input type="text" name="craditcarddate"/></td>
                            </tr>
                            <tr>
                                    <td> CVV kód</td>
                                    <td> <input type="text" name="craditcardcode"/></td>
                            </tr>
                    </tbody>
            </table>
            <input type="submit" value="Fizetek!"/>
        </form>
    </body>
</html>
