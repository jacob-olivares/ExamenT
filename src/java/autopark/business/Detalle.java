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
public class Detalle {
    private int idVoucher, idTicket, monto;
    private String lugar;

    public Detalle() {
    }

    public Detalle(int idVoucher, int idTicket, int monto, String lugar) {
        this.idVoucher = idVoucher;
        this.idTicket = idTicket;
        this.monto = monto;
        this.lugar = lugar;
    }

    public int getIdVoucher() {
        return idVoucher;
    }

    public void setIdVoucher(int idVoucher) {
        this.idVoucher = idVoucher;
    }

    public int getIdTicket() {
        return idTicket;
    }

    public void setIdTicket(int idTicket) {
        this.idTicket = idTicket;
    }

    public int getMonto() {
        return monto;
    }

    public void setMonto(int monto) {
        this.monto = monto;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    
    
}
