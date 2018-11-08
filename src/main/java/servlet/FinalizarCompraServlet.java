/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Cartao;
import classes.Cliente;
import classes.Financeiro;
import classes.ItemCarrinho;
import classes.Pedido;
import dao.ClienteDAO;
import dao.FinanceiroDAO;
import dao.PedidoDAO;

/**
 *
 * @author glima
 */
public class FinalizarCompraServlet extends HttpServlet {

	private static final long serialVersionUID = 6669225494450262843L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        	HttpSession session = request.getSession(false);
        	session.removeAttribute("carrinho");
            List<ItemCarrinho> carrinho = new ArrayList<>();
            session.setAttribute("carrinho", carrinho);

            Cartao cartao = new Cartao();
            int id_Cliente = (Integer.parseInt(request.getParameter("id_Cliente")));
            Cliente novo = ClienteDAO.getCliente(id_Cliente);
            int id_Pedido = Integer.parseInt(request.getParameter("id_Pedido"));
            Pedido pedido = PedidoDAO.getPedido(id_Pedido);

            cartao.setValidade(request.getParameter("validade"));
            //VERIFICA CVV CORRETO
            if (novo.getCartao().getCvv().equals(request.getParameter("cvv"))) {
                Financeiro financeiro = new Financeiro();
                double baixa = novo.getCartao().getSaldo() - pedido.getTotal();                
                //MONTA OBJETO FINANCEIRO
                FinanceiroDAO.getMaxID(financeiro);                
                financeiro.setId_pedido(pedido.getIdPedido());
                financeiro.setValorOperacao(pedido.getTotal());
                financeiro.setData(pedido.getDataPedido());
                //System.out.print("ID DA TRANSAÇÃO: " + pedido.getDataPedido());
                FinanceiroDAO.getSaldo(financeiro);
                financeiro.setSaldo(financeiro.getSaldo()+pedido.getTotal());
                
                PedidoDAO.addCartao(novo.getCartao().getId_cartao(), id_Pedido);
                PedidoDAO.baixaSaldoCartao(baixa, novo.getCartao().getId_cartao());
                FinanceiroDAO.Entrada(financeiro);                
                response.sendRedirect("jsp/CompraFinalizada.jsp?idPedido="+pedido.getIdPedido());
                //response.sendRedirect("Controle?action=verDetalhesCliente&id=" + id_Pedido);
            } else {
                response.sendRedirect("jsp/FinalizarCompra.jsp?id="+id_Pedido+"&status=cvv");
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FinalizarCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(FinalizarCompraServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}