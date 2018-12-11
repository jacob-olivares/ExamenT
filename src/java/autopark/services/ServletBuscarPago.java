/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package autopark.services;

import autopark.DAO.DAOVoucher;
import autopark.business.Voucher;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jhaco
 */
public class ServletBuscarPago extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rut = request.getParameter("rut_cliente");
        String rut_ = rut.replaceAll("-", "");
        int rut_cliente = Integer.parseInt(rut_);
        
        DAOVoucher dv = new DAOVoucher();
        ArrayList<Voucher> vouchers = dv.select();
        ArrayList<Voucher> vouchersAux = new ArrayList<>();
        
        for (int i = 0; i < vouchers.size(); i++) {
            if(vouchers.get(i).getRut_cliente() == rut_cliente){
                vouchersAux.add(new Voucher(vouchers.get(i).getIdVoucher(), vouchers.get(i).getTotal(), vouchers.get(i).getRut_cliente(), vouchers.get(i).getLugar()));
            }
        }
        request.getSession().setAttribute("vouchers", vouchersAux);
        response.sendRedirect("/ExamenDEJ1/pages/verPagos.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
