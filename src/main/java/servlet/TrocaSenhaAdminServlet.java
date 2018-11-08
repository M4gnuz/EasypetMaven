/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.AdminDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Luis Ragazzi
 */
@WebServlet(name = "TrocaSenhaAdminServlet", urlPatterns = {"/TrocaSenhaAdminServlet"})
public class TrocaSenhaAdminServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            int id = (int) session.getAttribute("idAdmin");
            String senhaAntiga = request.getParameter("inputAntigaSenha");
            String novaSenha = request.getParameter("inputNovaSenha");
            String novaSenhaConfir = request.getParameter("inputNovaSenhaConfir");
            String senha = AdminDAO.getSenha(id);
            if (novaSenha.equals(novaSenhaConfir)) {
                if (senha.equals(senhaAntiga)) {
                    AdminDAO.alteraSenha(id, novaSenha);
                    response.sendRedirect("jsp/Administrador/GerenciarClientes.jsp?status=ok");
                } else {
                    response.sendRedirect("jsp/Administrador/TrocaSenhaAdmin.jsp?status=senhaErrada");
                }
            }
            else{
                response.sendRedirect("jsp/Administrador/TrocaSenhaAdmin.jsp?status=senha");
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
