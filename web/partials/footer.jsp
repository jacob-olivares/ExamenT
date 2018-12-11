<footer class="py-5 bg-dark" style="height: 50px;">
    <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Todos los derechos reservados</p>
    </div>
    <!-- /.container -->
</footer>
<!-- Validacion de sesion -->
<%
    if(session.getAttribute("Usuario") == null){
    response.sendRedirect("/ExamenDEJ1/pages/login.jsp");
}%>