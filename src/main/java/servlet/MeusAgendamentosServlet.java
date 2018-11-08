/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Agendamento;
import dao.AgendamentoDAO;

/**
 *
 * @author alanfelipe
 */
@WebServlet(name = "MeusAgendamentosServlet", urlPatterns = {"/MeusAgendamentosServlet"})
public class MeusAgendamentosServlet extends HttpServlet {

	private static final long serialVersionUID = 82605259573992320L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        int idCLiente = 0;
        Cookie[] cookies = request.getCookies();        
        AgendamentoDAO daoAgendamento = new AgendamentoDAO();
        HttpSession session = request.getSession(false);
        
        for (Cookie cookei : cookies) {
            if (cookei.getName().equals("idCliente")) {
            	idCLiente = Integer.parseInt(cookei.getValue());
            }
        }

        try {
			List<Agendamento> agendamentos = daoAgendamento.getListaAgendamentoCliente(idCLiente);
	        session.setAttribute("listaAgendamento", agendamentos);
	        response.sendRedirect("jsp/MeusAgendamentosCliente.jsp");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
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
}