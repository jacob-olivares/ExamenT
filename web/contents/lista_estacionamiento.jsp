<div class="container" style="margin-left: 30px; margin-top: 20px;">           
  <table class="display" id="tabla">
    <thead>
      <tr>
        <th>Estacionamiento</th>
        <th>Monto</th>
        <th>N° Ticket</th>
        <th></th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="e" items="${equipos}">
        <tr>
            <td>${e.idEquipo}</td>
            <td>${e.marca}</td>
            <td>${e.modelo}</td>
        <c:choose>
            <c:when test="${e.estacionamiento == 1}">
                <td style="width: 100px;">Plaza Civica Valparaiso</td>
            </c:when>
            <c:when test="${e.estacionamiento == 2}">
                <td style="width: 100px;">Mirador el Sol- Quilpue</td>
            </c:when>
            <c:when test="${e.estacionamiento == 3}">
                <td style="width: 100px;">Plaza de armas - Santiago</td>
            </c:when>
            <c:when test="${e.estacionamiento == 4}">
                <td style="width: 100px;">Plaza de armas - Concepción</td>
            </c:when>
        </c:choose>
            <td style="width: 150px;">${e.fecha_ingreso}</td>
            <td style="width: 150px;">${e.fecha_salida}</td>
            <td style="width: 150px;">${e.descripcion}</td>
            <td>${e.rut_encargado}</td>
            <td style="width: 150px;">${e.rut_cliente}</td>
            <td>${e.estado}</td>
            <td>
                <a href="${pageContext.request.contextPath}/ServletModificarEquipo?idEquipo=${e.idEquipo}">
                    <i class="material-icons">create</i>
                </a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/ServletEliminarEquipo?idEquipo=${e.idEquipo}" class="confirmation">
                    <i class="material-icons">
                        clear
                    </i>
                </a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
  </table>
</div>