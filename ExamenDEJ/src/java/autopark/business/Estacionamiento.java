/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.business;

/**
 *
 * @author jhaco
 */
public class Estacionamiento {
    private int idEstacionamiento;
    private String lugar;

    public Estacionamiento() {
    }

    public Estacionamiento(int idEstacionamiento, String lugar) {
        this.idEstacionamiento = idEstacionamiento;
        this.lugar = lugar;
    }

    public int getIdEstacionamiento() {
        return idEstacionamiento;
    }

    public void setIdEstacionamiento(int idEstacionamiento) {
        this.idEstacionamiento = idEstacionamiento;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    
    
}
