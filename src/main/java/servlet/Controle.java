/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.YearMonth;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import classes.Alimento;
import classes.Fornecedor;
import classes.Pet;
import classes.Servico;
import dao.AlimentoDAO;
import dao.FornecedorDAO;
import dao.PetDAO;
import dao.ProdutoDAO;
import dao.ServicoDAO;

/**
 *
 * @author glima
 */
public class Controle extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 7368820843824010973L;

	/**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {

            String action = request.getParameter("action");

            if (action.equals("del")) {
                int id = Integer.parseInt(request.getParameter("id"));
                request.setAttribute("id", id);
                ProdutoDAO.excluirProduto(id);
                response.sendRedirect("jsp/MeusProdutos.jsp?status=OKdel");
            }

            Cookie[] cookies = request.getCookies();
            
            if (action.equals("alt")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Alimento novo = AlimentoDAO.getAlimentosUnitario(id);
                response.addCookie(new Cookie("idProduto", novo.getId() + ""));
                if (novo.getNomeIngrediente() != null) {
                    response.sendRedirect("jsp/EditarAlimento.jsp");
                    response.addCookie(new Cookie("idProduto", novo.getId() + ""));
                } else {
                    response.sendRedirect("jsp/EditarAcessorio.jsp");
                }
            } else if (action.equals("delForn")) {
                int id = Integer.parseInt(request.getParameter("id"));
                FornecedorDAO.excluirFornecedor(id);
            
            } else if (action.equals("comprar")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Alimento novo = AlimentoDAO.getAlimentosUnitario(id);
                response.addCookie(new Cookie("idProduto", id + ""));
                if (novo.getNomeIngrediente() != null) {
                    response.addCookie(new Cookie("nivelProd", "2"));
                    response.sendRedirect("jsp/PaginaProduto.jsp");
                } else {
                    response.addCookie(new Cookie("nivelProd", "1"));
                    response.sendRedirect("jsp/PaginaProduto.jsp");
                }
            
            } else if (action.equals("delPet")) {
                int id = Integer.parseInt(request.getParameter("id"));
                PetDAO.excluirPet(id);
                response.sendRedirect("jsp/MeusPets.jsp?status=OKdelPet");
            
            } else if (action.equals("altPet")) {
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idPet", id + ""));
                response.sendRedirect("jsp/EditarPet.jsp");
                
            } else if (action.equals("delServico")) {
                int id = Integer.parseInt(request.getParameter("id"));
                ServicoDAO.excluirServico(id);
                response.sendRedirect("jsp/MeusServicos.jsp");
            
            } else if (action.equals("altServico")) {
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idServico", id + ""));
                response.sendRedirect("jsp/EditarServicos.jsp");
            
            } else if (action.equals("agendarServ")) {
                int id = Integer.parseInt(request.getParameter("id"));
                int idCLiente = 0;

                for (Cookie cookei : cookies) {
                    if (cookei.getName().equals("idCliente")) {
                        idCLiente = Integer.parseInt(cookei.getValue());
                    }
                }

                Servico servico = ServicoDAO.getServico(id);
                Fornecedor fornecedor = FornecedorDAO.getFornecedor(servico.getIdFornecedor());
                List<Pet> listPet = PetDAO.getListaPetCliente(idCLiente);

                int day = LocalDateTime.now().getDayOfMonth();
                LocalDate limit = LocalDate.now().plusDays(14);
                YearMonth anoMes = YearMonth.of(LocalDateTime.now().getYear(), LocalDateTime.now().getMonthValue());
                Period intervalo = Period.between(anoMes.atDay(day), limit);
                
                List<LocalDate> listaDosDiasUteisDoMes
                        = Stream.iterate(anoMes.atDay(day), data -> data.plusDays(1))
                                .limit(intervalo.getDays())
                                .filter(data -> !data.getDayOfWeek().equals(DayOfWeek.SATURDAY) && !data.getDayOfWeek().equals(DayOfWeek.SUNDAY))
                                .collect(Collectors.toList());

                HttpSession session = request.getSession(true);

                //List<Pet> lista = (ArrayList<Pet>)session.getAttribute("listPet");
                session.setAttribute("fornecedor", fornecedor);
                session.setAttribute("servico", servico);
                session.setAttribute("listPet", listPet);
                session.setAttribute("idCliente", idCLiente);
                session.setAttribute("listaData", listaDosDiasUteisDoMes);

                response.addCookie(new Cookie("idServico", id + ""));
                response.sendRedirect("jsp/PaginadeServico.jsp");
            
            } else if (action.equals("verProduto")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Alimento novo = AlimentoDAO.getAlimentosUnitario(id);
                response.addCookie(new Cookie("idProduto", id + ""));
                if (novo.getNomeIngrediente() != null) {
                    response.addCookie(new Cookie("nivelProd", "2"));
                    response.sendRedirect("jsp/PaginaProduto.jsp");
                } else {
                    response.addCookie(new Cookie("nivelProd", "1"));
                    response.sendRedirect("jsp/PaginaProduto.jsp");
                }
                
            } else if (action.equals("verDetalhesCliente")) {
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idPedido", id + ""));
                response.sendRedirect("jsp/DetalhesPedidoCliente.jsp");
            
            } else if (action.equals("verDetalhesFornecedor")) {
                int id = Integer.parseInt(request.getParameter("id"));
                response.addCookie(new Cookie("idPedido", id + ""));
                response.sendRedirect("jsp/DetalhesPedido.jsp");
            }

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
