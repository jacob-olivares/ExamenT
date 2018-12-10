<%-- 
    Document   : index
    Created on : 05-12-2018, 20:46:16
    Author     : S7B4N
--%>

<%@page import="autopark.business.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="autopark.business.Estacionamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Estacionamiento> estacionamientos = (ArrayList < Estacionamiento >) session.getAttribute("es");
    String array = (String) session.getAttribute("tickets"); %>
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
            <%
                // Se crea la sesion para el usuario
                if (session.getAttribute("Usuario") == null) {
                    session.setAttribute("Usuario", request.getAttribute("User"));
                }
            %>
            <form action="${pageContext.request.contextPath}/ServletPagar" method="post">
                <table>
                    <tr>
                        <td>Rut: </td>
                        <td>
                            <input type="text" id="rut" name="rut_cliente" required oninput="checkRut(this)" placeholder="Ingrese RUT" class="form-control form-control"
                                   style="margin-left: 20px;">
                            <input type="text" id="array" value="<%=array%>" hidden>
                        </td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="nombre" class="form-control" placeholder="Ingrese nombre" required style="margin-left: 20px;"></td>
                    </tr>
                    <tr>
                        <td>Telefono: </td>
                        <td><input type="number" name="telefono" class="form-control" placeholder="Ingrese telefono" required style="margin-left: 20px;"></td>
                    </tr>
                    <tr>
                        <td>Email </td>
                        <td><input type="email" name="nombre" class="form-control" placeholder="Ingrese email" required style="margin-left: 20px;"></td>
                    </tr>
                </table>
                </form>
                <table>
                    <tr>
                        <td><p>Seleccione estacionamiento, indique la cantidad de dinero que mostro aplicacion movil:</p></td>
                    </tr>
                    <tr>
                        <td>
                            <select id="estas" name="estacionamiento" class="form-control">
                                <option value="0">Estacionamientos</option>
                                <% for(Estacionamiento e: estacionamientos){ %>
                                <option value="<%=e.getIdEstacionamiento()%>"><%=e.getLugar()%></option>
                                <% }%>
                            </select>
                        </td>
                        
                        <td><button onclick="agregarATabla()" class="form-control">Agregar</button></td>
                    </tr>
                </table>    
                            
                            <table class="table table-striped" id="tabla">
                                <thead>
                                    <tr>
                                        <th>Estacionamiento</th>
                                        <th>Monto</th>
                                        <th>N° Ticket</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody id="tb">
                                </tbody>
                            </table>           
        </main>
        <footer class="fixed-bottom">
            <%@include  file="../partials/footer.jsp" %>
        </footer>
    </body>
    <jsp:include page="../contents/validarRut.jsp"></jsp:include>
    <script>
        function agregarATabla(){
            var arrayString = document.getElementById("array").value;
            var arrayTickets = JSON.parse(arrayString);
            var sel = document.getElementById("estas");
            var text= sel.options[sel.selectedIndex].text;
            var value= sel.options[sel.selectedIndex].value;
            var table = document.getElementById('tabla').getElementsByTagName('tbody')[0];
            var iconHtml = '<i class="material-icons">clear</i>';
            var str = '<a href="#" onclick="eliminar(this);">' + iconHtml + '</a>';
            var newRow   = table.insertRow(table.rows.length);
            var newCell1  = newRow.insertCell(0);
            var newCell2  = newRow.insertCell(1);
            var newCell3  = newRow.insertCell(2);
            var newCell4  = newRow.insertCell(3);
            
            
            for (var i = 0; i < arrayTickets.length; i++) {
                var obj = arrayTickets[i];
                if(value === obj.idEstacionamiento){
                    newCell1.innerHTML = text;
                    newCell2.innerHTML = obj.monto;
                    newCell3.innerHTML = obj.idTicket;
                    newCell4.innerHTML = str;
                    newCell1.appendChild();
                }
            }

        }
        
        function eliminar(r){
            var index, table = document.getElementById('tabla');
            for(var i = 1; i < table.rows.length; i++)
            {
                table.rows[i].cells[3].onclick = function()
                {
                    var c = confirm("Quieres eliminar el ticket?");
                    if(c === true)
                    {
                        index = this.parentElement.rowIndex;
                        table.deleteRow(index);
                    }
                    //console.log(index);
                };
            }
        }
    </script>
</html>