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
public class Voucher {
    private int idVoucher, total, rut_cliente;
    private String lugar;

    public Voucher() {
    }

    public Voucher(int idVoucher, int total, int rut_cliente) {
        this.idVoucher = idVoucher;
        this.total = total;
        this.rut_cliente = rut_cliente;
    }

    public Voucher(int idVoucher, int total, int rut_cliente, String lugar) {
        this.idVoucher = idVoucher;
        this.total = total;
        this.rut_cliente = rut_cliente;
        this.lugar = lugar;
    }

    public String getLugar() {
        return lugar;
    }

    public void setLugar(String lugar) {
        this.lugar = lugar;
    }
    

    public int getIdVoucher() {
        return idVoucher;
    }

    public void setIdVoucher(int idVoucher) {
        this.idVoucher = idVoucher;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getRut_cliente() {
        return rut_cliente;
    }

    public void setRut_cliente(int rut_cliente) {
        this.rut_cliente = rut_cliente;
    }
    
    
}
