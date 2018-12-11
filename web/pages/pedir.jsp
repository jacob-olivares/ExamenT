<%-- 
    Document   : pedir
    Created on : 11-12-2018, 14:01:45
    Author     : jhaco
--%>

<%@page import="autopark.business.Detalle"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <%@include  file="../partials/head.jsp" %>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <%@include  file="../partials/menu.jsp" %>
        </nav>
        <main>
            
<div class="container" style="margin-left: 30px; margin-top: 20px;">
    <form action="#" method="post">
        <table class="display" id="tabla">
            <thead>
                <tr>
                    <th>Estacionamiento</th>
                    <th>Monto</th>
                    <th>Nro Ticket</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ArrayList<Detalle> detalle = (ArrayList<Detalle>)session.getAttribute("detalle");
                    for(int i = 0; i<detalle.size(); i++){ %>
                <tr>
                    <td><%=detalle.get(i).getLugar()%></td>
                    <td><%=detalle.get(i).getMonto()%></td>
                    <td><%=detalle.get(i).getIdTicket()%></td>
                </tr>
            <% }%>
            </tbody>
        </table>       
    </form>
</div>
        </main>
        <footer class="fixed-bottom">
            <%@include  file="../partials/footer.jsp" %>
        </footer>
    </body>
</html>
