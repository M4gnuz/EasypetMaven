/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Cliente;
import classes.ItemCarrinho;
import classes.Pedido;
import classes.Produto;
import dao.ClienteDAO;
import dao.PedidoDAO;

/**
 *
 * @author alanfelipe
 */
@WebServlet(name = "FinalizarPedidoServlet", urlPatterns = { "/FinalizarPedidoServlet" })
public class FinalizarPedidoServlet extends HttpServlet {

	private static final long serialVersionUID = 2005456137407425344L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");

		Cliente cliente = new Cliente();
		PedidoDAO pedidoDAO = new PedidoDAO();
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession(false);
		
		@SuppressWarnings("unchecked")
		List<ItemCarrinho> carrinho = (List<ItemCarrinho>) session.getAttribute("carrinho");
		
		int idPedido = 0;
		int idCLiente = 0;
		
		for (Cookie cookei : cookies) {
			if (cookei.getName().equals("idCliente")) {
				idCLiente = Integer.parseInt(cookei.getValue());
			}
		}

		try {
			Pedido pedido = pedidoDAO.insertPedido(carrinho, idCLiente);
			cliente = ClienteDAO.getCliente(pedido.getIdCliente());

			session.setAttribute("cliente", cliente);
			session.setAttribute("pedido", pedido);
			Produto produto = new Produto();
			idPedido = pedido.getIdPedido();

			for (int x = 0; x < pedido.getItensPedido().size(); x++) {
				int baixa = pedido.getItensPedido().get(x).getQuantidade();
				int idProduto = pedido.getItensPedido().get(x).getProduto().getId();
				PedidoDAO.baixaEstoque(produto, idProduto, baixa);
			}

		} catch (SQLException ex) {
			Logger.getLogger(FinalizarPedidoServlet.class.getName()).log(Level.SEVERE, null, ex);
		}

		response.sendRedirect("jsp/FinalizarCompra.jsp?id=" + idPedido);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}
}