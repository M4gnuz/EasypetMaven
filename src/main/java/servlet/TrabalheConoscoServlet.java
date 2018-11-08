/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import JavaMail.JavaMailApp;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rebeca
 */
@WebServlet(name = "TrabalheConoscoServlet", urlPatterns = {"/TrabalheConoscoServlet"})
public class TrabalheConoscoServlet extends HttpServlet {

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
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String areaInteresse = request.getParameter("areaInteresse");
            String telefone = request.getParameter("telefone");
            
            String formacao1 = request.getParameter("formacao1");
            String formacao2 = request.getParameter("formacao2");
            String experiencia1 = request.getParameter("experiencia1");
            String experiencia2 = request.getParameter("experiencia2");
            String idioma1 = request.getParameter("idioma1");
            String idioma2 = request.getParameter("idioma2");
            String infoComplementares = request.getParameter("infoComplementares");
            
            JavaMailApp.enviarEmailTrabalheConosco(nome,email, areaInteresse, telefone, formacao1, formacao2, experiencia1, experiencia2, idioma1, idioma2, infoComplementares  );
                response.sendRedirect("jsp/TrabalheConosco_v2.jsp?status=OK");   
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
