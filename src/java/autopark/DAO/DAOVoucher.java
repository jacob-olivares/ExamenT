/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.DAO;

import autopark.business.CRUD;
import autopark.business.Voucher;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jhaco
 */
public class DAOVoucher implements CRUD<Voucher>{
    private static Conexion objConn = Conexion.InstanciaConn();
    ResultSet rs;
    
    @Override
    public boolean insert(Voucher x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Voucher x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Voucher> select() {
        String query = "SELECT e.lugar as lugar, v.idVoucher as idVoucher, v.total as total, v.rut_cliente as rut_cliente FROM VOUCHER v INNER JOIN detalle d "
                + "ON (d.idVoucher = v.idVoucher) INNER JOIN Ticket t ON "
                + "(d.idTicket = t.idTicket) INNER JOIN ESTACIONAMIENTO e ON (e.idEstacionamiento = t.idEstacionamiento);";
        ArrayList<Voucher> vouchers = new ArrayList<>();
        try {
            PreparedStatement ps = objConn.getConn().prepareStatement(query);
            rs = ps.executeQuery();

            while (rs.next()) {
                vouchers.add(new Voucher(rs.getInt("idVoucher"), rs.getInt("total"), rs.getInt("rut_cliente"), rs.getString("lugar")));
            }
            return vouchers;
        } catch (SQLException ex) {
            Logger.getLogger(DAOVoucher.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    
}
