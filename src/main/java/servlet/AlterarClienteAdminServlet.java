/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Cliente;
import dao.ClienteDAO;
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
public class AlterarClienteAdminServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8936575427745514528L;

	/**
	 * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
	 * methods.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		
		try (PrintWriter out = response.getWriter()) {
			Cliente cliente = new Cliente();

			String data = request.getParameter("data");
			String datanova = "";
			for (int x = 0; x < data.length(); x++) {
				if (data.charAt(x) != '/')
					datanova += data.charAt(x);
			}
			String mes = datanova.charAt(2) + "" + datanova.charAt(3);
			String dia = datanova.charAt(0) + "" + datanova.charAt(1);
			String ano = datanova.charAt(4) + "" + datanova.charAt(5) + "" + datanova.charAt(6) + "" + datanova.charAt(7);
			String dataCerta = ano + "/" + mes + "/" + dia;
			
			System.out.print(dataCerta);

			cliente.setNome(request.getParameter("nome"));
			cliente.setSobreNome(request.getParameter("sobrenome"));
			cliente.setSenha(request.getParameter("senha"));
			cliente.setTelefone(request.getParameter("telefone"));
			cliente.setCep(request.getParameter("cep"));
			cliente.setEndereco(request.getParameter("endereco"));
			cliente.setNrRua(request.getParameter("numero"));
			cliente.setComplemento(request.getParameter("complemento"));
			cliente.setDtNascimento(dataCerta);
			cliente.setBairro(request.getParameter("bairro"));
			cliente.setCidade(request.getParameter("cidade"));
			String masc = request.getParameter("customRadio");
			String fem = request.getParameter("customRadio");
			
			if ("M".equals(masc)) {
				cliente.setSexo('M');
			}
			if ("F".equals(fem)) {
				cliente.setSexo('F');
			}

			int id = 0;
			for (Cookie cookie : request.getCookies()) {
				if (cookie.getName().equals("idCliente")) {
					id = Integer.parseInt(cookie.getValue());
				}
			}

			cliente.setId(id);

			ClienteDAO.alteraCliente(cliente);
			response.sendRedirect("jsp/Administrador/GerenciarClientes.jsp");
		}
	}

	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request  servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException      if an I/O error occurs
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
	}
}