/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Fornecedor;
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
public class LoginFornecedorServlet extends HttpServlet {

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
            String email = request.getParameter("emailL");
            String senha = request.getParameter("senhaL");

            Fornecedor novo = FornecedorDAO.loginFornecedor(email, senha);

            Cookie[] cookies = request.getCookies();

            if (email.equals("admin") && senha.equals("admin")) {
                response.sendRedirect("jsp/Administrador/LoginAdmin.jsp");
            } else {
                if (email.equals(novo.getEmail())) {
                    if (novo.getSenha().equals(senha)) {
                        response.addCookie(new Cookie("idFornecedor", novo.getId() + ""));
                        response.addCookie(new Cookie("email", email + ""));
                        response.addCookie(new Cookie("nivel", "2"));
                        response.sendRedirect("jsp/MeusProdutos.jsp?status=Login");
                    }
                } else {
                    out.print("<script type=\'text/javascript\'>");
                    out.println("history.go(-1)");
                    out.println("alert('EMAIL OU SENHA INVÁLIDOS INVÁLIDOS!')");
                    out.print("</script>");
                }
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
