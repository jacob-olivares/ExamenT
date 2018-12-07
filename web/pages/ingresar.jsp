<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include  file="../partials/head.jsp" %>
    </head>
    <body>
        <div class="container-fluid">
            <div class="container-fluid">
                <div class="row no-gutters">
                    <div class="col-md-2">
                        <aside>
                        <br/>
                        <img src="../img/autopark.jpg"><br/>
                        <a href="../pages/ingresar.jsp">Inicio</a><br/>
                        <a href="../pages/listar.jsp">Ver Pagos/Compras</a>
                        </aside>
                        <br/><br/><br/><br/><br/><br/><br/><br/>
                        <p>Opciones de Pago</p>
                        <div class="form-check">
                          <label class="form-check-label" for="transferencia">
                            <input type="radio" class="form-check-input" id="radio1" name="radTrans" value="trans" checked>Transferencia
                          </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="pago">
                            <input type="radio" class="form-check-input" id="radio1" name="radPago" value="pago" checked>Pago en Linea
                          </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="orden">
                            <input type="radio" class="form-check-input" id="radio1" name="radOrden" value="orden" checked>Orden de Compra
                          </label>
                        </div>
                        <br/>
                        <p>Opciones de Envío Boleta</p>
                        <div class="form-check">
                          <label class="form-check-label" for="radio1">
                            <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option1" checked>Correo Electrónico
                          </label>
                        </div>
                        <div class="form-check">
                          <label class="form-check-label" for="radio1">
                            <input type="radio" class="form-check-input" id="radio1" name="optradio" value="option2" checked>Dirección Particular
                          </label>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="container">
                            <br/>
                            <h2>Datos empresa</h2>
                            <br/>
                            <form action="/action_page.php">
                                <div class="form-group">
                                    <label for="text">Rut:</label>
                                    <input type="text" class="form-control" id="rut" placeholder="" name="rut">
                                </div>

                                <div class="form-group">
                                  <label for="text">Nombre:</label>
                                  <input type="text" class="form-control" id="nombre" placeholder="" name="nombre">
                                </div>

                                <div class="form-group">
                                  <label for="text">Telefono:</label>
                                  <input type="text" class="form-control" id="telefono" placeholder="" name="telefono">
                                </div>

                                <div class="form-group">
                                    <label for="email">E-mail:</label>
                                    <input type="email" class="form-control" id="email">
                                </div>

                                <div class="form-group">
                                    <label for="text">Seleccione estacionamiento:</label>
                                    <select class="form-control" name="tipo" required>
                                    </select>
                                </div>

                                <br/>
                                <button type="submit" class="btn btn-success">Agregar</button>
                            </form>
                            <br/>
                            <div class="container">
                                <%@include file="../contents/lista_estacionamiento.jsp" %>
                            </div>
                            <br/>
                            <button type="submit" class="btn btn-success">Pagar</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
