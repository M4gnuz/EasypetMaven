/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import classes.Cliente;
import classes.Fornecedor;
import classes.Pet;
import classes.Servico;
import dao.AgendamentoDAO;
import dao.ClienteDAO;
import dao.FornecedorDAO;
import dao.PetDAO;
import dao.ServicoDAO;

/**
 *
 * @author alanfelipe
 */
@WebServlet(name = "AgendaServicoServlet", urlPatterns = {"/AgendaServicoServlet"})
public class AgendaServicoServlet extends HttpServlet {

	private static final long serialVersionUID = -1220620931058181076L;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Pet pet = new Pet();

        int idFornecedor = Integer.parseInt(request.getParameter("idFornecedor"));
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        int idServico = Integer.parseInt(request.getParameter("idServico"));
        int idPet = Integer.parseInt(request.getParameter("idPet"));
        String dataAgendament = request.getParameter("dataAgendamento") + " " + request.getParameter("horaAgendamento");

        Fornecedor fornecedor = FornecedorDAO.getFornecedor(idFornecedor);
        Cliente cliente = ClienteDAO.getCliente(idCliente);
        Servico servico = ServicoDAO.getServico(idServico);
        PetDAO.getPet(pet, idPet);

        AgendamentoDAO agendamentoDAO = new AgendamentoDAO();
        
        try {
            agendamentoDAO.insetAgendamento(fornecedor, cliente, pet, servico, dataAgendament);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
        
        response.sendRedirect("jsp/MeusAgendamentosCliente.jsp");
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