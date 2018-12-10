/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.DAO;

import autopark.business.CRUD;
import autopark.business.Ticket;
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
public class DAOTicket implements CRUD<Ticket>{
    private static Conexion objConn = Conexion.InstanciaConn();
    ResultSet rs;

    @Override
    public boolean insert(Ticket x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Ticket x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Ticket> select() {
        String query = "SELECT * FROM TICKET;";
        ArrayList<Ticket> tickets = new ArrayList<>();
        try {
            PreparedStatement ps = objConn.getConn().prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()){
                tickets.add(new Ticket(rs.getInt("idTicket"), rs.getInt("idEstacionamiento"), rs.getInt("monto")));
            }
            return tickets;
        } catch (SQLException ex) {
            Logger.getLogger(DAOTicket.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
