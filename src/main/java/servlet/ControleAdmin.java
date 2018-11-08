/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.ClienteDAO;
import dao.FornecedorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author glima
 */
public class ControleAdmin extends HttpServlet {

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
            
            String action = request.getParameter("action");           
            
            /* TODO output your page here. You may use following sample code. */
            if(action.equals("editClienteAdmin")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idCliente", id+""));
                response.sendRedirect("jsp/Administrador/EditarCadastroClienteAdmin.jsp");
            }
            
            if(action.equals("editFornAdmin")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idFornecedor", id+""));
                response.sendRedirect("jsp/Administrador/EditarCadastroFornecedorAdmin.jsp");
            }
            
            if(action.equals("enableForn")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idFornecedor", id+""));
                FornecedorDAO.alteraStatus(id, "ATIVADO");
                response.sendRedirect("jsp/Administrador/GerenciarFornecedor.jsp?status=enabled");
            }
            if(action.equals("disableForn")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idFornecedor", id+""));
                FornecedorDAO.alteraStatus(id, "DESATIVADO");
                response.sendRedirect("jsp/Administrador/GerenciarFornecedor.jsp?status=disabled");
            }
            if(action.equals("enableCliente")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idCliente", id+""));
                ClienteDAO.alteraStatus(id, "ATIVADO");
                response.sendRedirect("jsp/Administrador/GerenciarClientes.jsp?status=enabled");
            }
            if(action.equals("disableCliente")){
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idCliente", id+""));
                ClienteDAO.alteraStatus(id, "DESATIVADO");
                response.sendRedirect("jsp/Administrador/GerenciarClientes.jsp?status=disabled");
            }
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
