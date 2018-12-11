
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
                    ArrayList<Voucher> vouchers = (ArrayList<Voucher>)session.getAttribute("vouchers");
                    for(int i = 0; i<vouchers.size(); i++){ %>
                <tr>
                    <td><%=vouchers.get(i).getLugar()%></td>
                    <td><%=vouchers.get(i).getTotal()%></td>
                    <td><%=vouchers.get(i).getTotal()%></td>
                </tr>
            <% }%>
            </tbody>
        </table>       
    </form>
</div>