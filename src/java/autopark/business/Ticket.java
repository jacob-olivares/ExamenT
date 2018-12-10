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
public class Ticket {
    private int idTicket, idEstacionamiento, monto;

    public Ticket() {
    }

    public Ticket(int idTicket, int idEstacionamiento, int monto) {
        this.idTicket = idTicket;
        this.idEstacionamiento = idEstacionamiento;
        this.monto = monto;
    }

    public int getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(int idTicket) {
        this.idTicket = idTicket;
    }

    public int getIdEstacionamiento() {
        return idEstacionamiento;
    }

    public void setIdEstacionamiento(int idEstacionamiento) {
        this.idEstacionamiento = idEstacionamiento;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }
}
