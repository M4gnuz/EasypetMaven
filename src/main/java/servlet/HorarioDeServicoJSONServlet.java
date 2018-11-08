/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Fornecedor;
import classes.Servico;
import com.google.gson.Gson;
import dao.ServicoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
@WebServlet(name = "HorarioDeServicoJSONServlet", urlPatterns = {"/HorarioDeServicoJSONServlet"})
public class HorarioDeServicoJSONServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 5484289219042528105L;

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

        try {
            List<LocalDateTime> listaHorarios = new ArrayList<>();
            HttpSession session = request.getSession(false);
            Fornecedor fornecedor = (Fornecedor) session.getAttribute("fornecedor");
            int idServico = Integer.parseInt(request.getParameter("idServico"));
            Servico servico = ServicoDAO.getServico(idServico);

            String data = request.getParameter("dataSelecionada");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

            String dataIni = data + " " + fornecedor.getInicio();
            String dataTerm = data + " " + fornecedor.getTermino();
            String duracao = "PT" + servico.getTempo().split(":")[0] + "H" + servico.getTempo().split(":")[1] + "M";

            LocalDateTime inicioJornada = LocalDateTime.parse(dataIni, formatter);
            LocalDateTime fimJornada = LocalDateTime.parse(dataTerm, formatter);

            Duration duracaoServico = Duration.parse(duracao);
            Duration dur = Duration.between(inicioJornada, fimJornada);
            dur = dur.minusHours(1);
            dur = dur.dividedBy(duracaoServico.toHours());
            
            int limite = Math.toIntExact(dur.toHours());
            
            
            LocalDateTime horario = inicioJornada;
            listaHorarios.add(horario);

            for (int i = 0; i < limite; i++) {
                horario = horario.plusHours(duracaoServico.toHours());
                listaHorarios.add(horario);
            }

            Gson gson = new Gson();
            
            PrintWriter out = response.getWriter();
            response.setContentType("application/json;charset=UTF-8");
            out.print(gson.toJson(listaHorarios));
            out.flush();

        } catch (Exception e) {
            throw new ServletException(e);
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
