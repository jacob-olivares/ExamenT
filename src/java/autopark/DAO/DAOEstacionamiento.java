/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.DAO;

import autopark.business.CRUD;
import autopark.business.Estacionamiento;
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
public class DAOEstacionamiento implements CRUD<Estacionamiento>{
    private static Conexion objConn = Conexion.InstanciaConn();
    ResultSet rs;
    
    @Override
    public boolean insert(Estacionamiento x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean update(Estacionamiento x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean delete(int x) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Estacionamiento> select() {
        String query = "SELECT * FROM ESTACIONAMIENTO;";
        ArrayList<Estacionamiento> estacionamientos = new ArrayList<>();
        try {
            PreparedStatement ps = objConn.getConn().prepareStatement(query);
            rs = ps.executeQuery();
            
            while(rs.next()){
                estacionamientos.add(new Estacionamiento(rs.getInt("idEstacionamiento"), rs.getString("lugar")));
            }
            return estacionamientos;
        } catch (SQLException ex) {
            Logger.getLogger(DAOEstacionamiento.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
