<%-- 
    Document   : index
    Created on : 05-12-2018, 20:46:16
    Author     : S7B4N
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="autopark.business.Ticket"%>
<%@page import="java.util.ArrayList"%>
<%@page import="autopark.business.Estacionamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    ArrayList<Estacionamiento> estacionamientos = (ArrayList < Estacionamiento >) session.getAttribute("es");
%>
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
                        </td>
                        <td>
                            <label style="margin-left: 100px;" >Opcion de pago</label>
                        </td>
                        <td>  <fieldset style="margin-left: 20px;" id="group1" name="opPago" class="form-control">
                                <input type="radio" value="1" name="group1">Pago en Linea
                                <input type="radio" value="2" name="group1">Transferencia
                                <input type="radio" value="3" name="group1">Orden de compra
                            </fieldset></td>
                    </tr>
                    <tr>
                        <td>Nombre: </td>
                        <td><input type="text" name="nombre" class="form-control" placeholder="Ingrese nombre" required style="margin-left: 20px;"></td>
                        <td>
                            <label style="margin-left: 100px;" >Opcion de envio de boleta</label>
                        </td>   
                        <td>  <fieldset style="margin-left: 20px;" id="group2" name="opEnv" class="form-control">
                                <input type="radio" value="1" name="group2">Correo electronico
                                <input type="radio" value="2" name="group2">Direccion particular
                            </fieldset></td>
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
                                <%
                                }%>
                            </select>
                        </td>
                        
                        <td><button onclick="agregarATabla()" class="form-control">Agregar</button></td>  <td><button onclick="totalPagar()" type="submit" style="margin-left: 100px;background-color: lightblue;" class="form-control">Pagar</button></td>
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
                                <tbody>
                                </tbody>
                            </table>   
            </form>
        </main>
        <footer class="fixed-bottom">
            <%@include  file="../partials/footer.jsp" %>
        </footer>
    </body>
    <jsp:include page="../contents/validarRut.jsp"></jsp:include>
    <script>

        function agregarATabla(){
            var sel = document.getElementById("estas");
            var text= sel.options[sel.selectedIndex].text;
            var value= sel.options[sel.selectedIndex].value;
            var table = document.getElementById('tabla');
            var iconHtml = '<i class="material-icons">clear</i>';
            var str = '<a href="#" onclick="eliminar(this);">' + iconHtml + '</a>';
            var newRow   = table.insertRow(1);
            var newCell1  = newRow.insertCell(0);
            var newCell2  = newRow.insertCell(1);
            var newCell3  = newRow.insertCell(2);
            var newCell4  = newRow.insertCell(3);
                        
            if(value.localeCompare("0") === 0){
                alert("Ingrese estacionamiento!");
            }
            
            if(value.localeCompare("1") === 0){
                newCell1.innerHTML = text;
                newCell2.innerHTML = 500;
                newCell3.innerHTML = 1;
                newCell4.innerHTML = str;
            }
            if(value.localeCompare("2") === 0){
                newCell1.innerHTML = text;
                newCell2.innerHTML = 1000;
                newCell3.innerHTML = 2;
                newCell4.innerHTML = str;
            }
            if(value.localeCompare("3") === 0){
                newCell1.innerHTML = text;
                newCell2.innerHTML = 1500;
                newCell3.innerHTML = 3;
                newCell4.innerHTML = str;
            }
            if(value.localeCompare("4") === 0){
                newCell1.innerHTML = text;
                newCell2.innerHTML = 2000;
                newCell3.innerHTML = 4;
                newCell4.innerHTML = str;
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