/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.DAO;

import autopark.business.CRUD;
import autopark.business.Detalle;
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
public class DAODetalle implements CRUD<Detalle>{
    private static Conexion objConn = Conexion.InstanciaConn();
    ResultSet rs;
    @Override
    public boolean insert(Detalle x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Detalle x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    public ArrayList<Detalle> select1(int x) {
        String query = "SELECT e.lugar as lugar, t.monto as monto, d.idTicket as idTicket, d.idVoucher as idVoucher "
                + "FROM DETALLE d INNER JOIN TICKET T ON(d.idTicket = t.idTicket) INNER JOIN ESTACIONAMIENTO e "
                + "ON(t.idEstacionamiento = e.idEstacionamiento) WHERE d.idVoucher = ?;";
        ArrayList<Detalle> detalle = new ArrayList<>();
        try {
            PreparedStatement ps = objConn.getConn().prepareStatement(query);
            ps.setInt(1, x);
            rs = ps.executeQuery();
            
            while(rs.next()){
                detalle.add(new Detalle(rs.getInt("idVoucher"), rs.getInt("idTicket"), rs.getInt("monto"), rs.getString("lugar")));
            }
            return detalle;
        } catch (SQLException ex) {
            Logger.getLogger(DAODetalle.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public ArrayList<Detalle> select() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
