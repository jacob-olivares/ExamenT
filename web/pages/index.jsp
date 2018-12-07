<%-- 
    Document   : index
    Created on : 05-12-2018, 20:46:16
    Author     : S7B4N
--%>

<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include  file="../partials/head.jsp" %>
    </head>
    <body>
        <nav>
            <%@include  file="../partials/menu.jsp" %>
        </nav>
        <main>
            <%
                // Se crea la sesion para el usuario
                session.setAttribute("Usuario", request.getAttribute("User"));
                %>
        </main>
        <footer class="fixed-bottom">
            <%@include  file="../partials/footer.jsp" %>
        </footer>
    </body>
</html>
