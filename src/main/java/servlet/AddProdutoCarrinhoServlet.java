/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Alimento;
import classes.ItemCarrinho;
import classes.Produto;
import dao.AlimentoDAO;
import dao.ProdutoDAO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author alanfelipe
 */
@WebServlet(name = "AddProdutoCarrinhoServlet", urlPatterns = {"/AddProdutoCarrinhoServlet"})
public class AddProdutoCarrinhoServlet extends HttpServlet {

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

        Produto prod = new Produto();
        Alimento alimento;
        ItemCarrinho itemCart = new ItemCarrinho();
        
        HttpSession session = request.getSession(true);
        List<ItemCarrinho> carrinho = (List<ItemCarrinho>) session.getAttribute("carrinho");
        
        int id = Integer.parseInt(request.getParameter("idProduto"));
        int nivel = Integer.parseInt(request.getParameter("nivel"));

        if (nivel == 1) {
            ProdutoDAO.getAcessorio(prod, id);
            itemCart.setProduto(prod);
            itemCart.setQuantidade(1);
            carrinho.add(itemCart);
        } else {
            alimento = AlimentoDAO.getAlimentosUnitario(id);
            itemCart.setProduto(alimento);
            itemCart.setQuantidade(1);
            carrinho.add(itemCart);
        }
        
        session.removeAttribute("carrinho");
        session.setAttribute("carrinho", carrinho);
        response.sendRedirect("jsp/Carrinho.jsp");
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
