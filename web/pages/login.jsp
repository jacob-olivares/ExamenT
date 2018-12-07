<%-- 
    Document   : login
    Created on : 05-12-2018, 20:46:24
    Author     : S7B4N
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
     <head>
        <%@include file="../partials/head.jsp" %>
    </head>
    <body>
        <div class="container" style="width: 400px; margin-top: 80px;">
            <div class="card card-container">
                <img id="profile-img" class="profile-img-card" src="../img/autopark.jpg" style="height: 300px" />
                <p id="profile-name" class="profile-name-card"></p>
                <form class="form-signin" action="${pageContext.request.contextPath}/ServletLogin" method="POST">
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" id="inputEmail" class="form-control" placeholder="RUT" name="username" required autofocus>
                    <input type="password" id="inputPassword" class="form-control" placeholder="Contraseña" name="password" required>
                    <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Entrar</button>
                </form><!-- /form -->
                <% if(request.getAttribute("Mensaje") != null){ %>
                    <h2><%=request.getAttribute("Mensaje")%></h2>
                <% }
                   request.setAttribute("Mensaje", null);
                %>
            </div><!-- /card-container -->
        </div><!-- /container -->
    </body>
</html>
