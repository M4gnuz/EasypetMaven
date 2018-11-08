/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Servico;
import dao.ServicoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Luis Ragazzi
 */
@WebServlet(name = "EditarServicoServlet", urlPatterns = {"/EditarServicoServlet"})
public class EditarServicoServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            int idServico = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idServico")) {
                    idServico = Integer.parseInt(cookie.getValue());

                }                
            }
            String preco = request.getParameter("precoA");
            String converte = "";            
            float valor = 0;
            //VALIDA PREÇO
            for (int i = 0; i < preco.length(); i++) {
                preco.charAt(i);
                if (preco.charAt(i) != '.' && preco.charAt(i) != ',') {
                    converte += preco.charAt(i);
                }
                if (preco.charAt(i) == ',') {
                    converte += ".";
                }
            } 
            valor = Float.parseFloat(converte);
            
            //CONVERSÃO FRETE
            String frete =  request.getParameter("precoB");
            String converte2 = "";            
            float valor2 = 0;  
            for (int i = 0; i < frete.length(); i++) {
                frete.charAt(i);
                if (frete.charAt(i) != '.' && frete.charAt(i) != ',') {
                    converte2 += frete.charAt(i);
                }
                if (frete.charAt(i) == ',') {
                    converte2 += ".";
                }
            } 
            valor2 = Float.parseFloat(converte2);
            Servico serv = new Servico();
            serv.setId(idServico);
            serv.setCategoria(request.getParameter("categoria"));
            serv.setDescricao(request.getParameter("descricao"));
            serv.setAnimal(request.getParameter("animal"));
            serv.setPorte(request.getParameter("porte"));
            serv.setPreco(valor);
            serv.setFrete(valor2);
            serv.setTempo(request.getParameter("tempo"));
            
            ServicoDAO.alterarServico(serv);
            response.sendRedirect("jsp/MeusServicos.jsp");
            
        }
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
        processRequest(request, response);
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
