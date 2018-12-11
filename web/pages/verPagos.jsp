<%-- 
    Document   : verPagos
    Created on : 11-12-2018, 9:05:03
    Author     : jhaco
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="autopark.business.Voucher"%>
<%@page import="java.util.ArrayList"%>  
<!DOCTYPE html>
<html>
    <head>
        <%@include  file="../partials/head.jsp" %>
    </head>
    <body>
        <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
            <%@include  file="../partials/menu.jsp" %>
        </nav>
        <main>
            <form method="get" class="form-inline" action="${pageContext.request.contextPath}/ServletBuscarPago" style="margin-top: 50px; margin-left: 400px;">
                <label for="rut_cliente" class="mr-sm-2">Rut cliente:</label>
                <input type="text" id="rut_cliente" name="rut_cliente" required oninput="checkRut(this)" placeholder="Ingrese RUT" class="form-control form-control"
                       style="margin-left: 20px;">
                <button type="submit" class="btn btn-primary mb-2" style="margin-left: 20px; width: 100px;" >Buscar</button>
            </form>
            
<div class="container" style="margin-left: 30px; margin-top: 20px;">
    <form action="#" method="post">
        <table class="display" id="tabla">
            <thead>
                <tr>
                    <th>Estacionamiento</th>
                    <th>Total</th>
                    <th>Pedir</th>
                </tr>
            </thead>
            <tbody>
                <%
                    if(session.getAttribute("vouchers")!= null){
                    ArrayList<Voucher> vouchers = (ArrayList<Voucher>)session.getAttribute("vouchers");
                    for(int i = 0; i<vouchers.size(); i++){ %>
                <tr>
                    <td><%=vouchers.get(i).getLugar()%></td>
                    <td><%=vouchers.get(i).getTotal()%></td>
                    <td><a href="#"><i class="material-icons">
                                add
                            </i></a></td>
                </tr>
            <% } }%>
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
<jsp:include page="../contents/validarRut.jsp"></jsp:include>
<script>
    $(document).ready( function () {
    $('#tabla').DataTable();
       
    } );
    $.extend( $.fn.dataTable.defaults, {
    searching: false,
    ordering:  false
        
} );
        
$('#tabla').dataTable( {
    "pageLength": 5,
    "lengthChange": false
} );
</script>