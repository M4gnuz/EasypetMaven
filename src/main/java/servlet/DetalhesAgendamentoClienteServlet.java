package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Agendamento;
import dao.AgendamentoDAO;

@WebServlet(name = "DetalhesAgendamentoClienteServlet", urlPatterns = {"/DetalhesAgendamentoClienteServlet"})
public class DetalhesAgendamentoClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int idAgendamento = Integer.parseInt(request.getParameter("id"));
		AgendamentoDAO daoAgend = new AgendamentoDAO();
		HttpSession session = request.getSession(false);

		try {
			Agendamento agendamento = daoAgend.getAgendamento(idAgendamento);
			session.setAttribute("agendamento", agendamento);
			response.sendRedirect("jsp/DetalhesAgendamentoCliente.jsp");
		} catch (SQLException e) {
			throw new ServletException(e);
		}
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.processRequest(request, response);
	}
}