/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import classes.Pet;
import dao.PetDAO;
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
public class CadastroPetServlet extends HttpServlet {
Pet pet = new Pet();
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
           
            String data = request.getParameter("dataV");
            String datanova = "";
            for(int x = 0; x<data.length();x++){
                if(data.charAt(x)!='/')
               datanova+=data.charAt(x);
            }
            String mes=datanova.charAt(2)+""+datanova.charAt(3);
            String dia =datanova.charAt(0)+""+datanova.charAt(1);
            String ano =datanova.charAt(4)+"" + datanova.charAt(5)+"" + datanova.charAt(6)+"" + datanova.charAt(7);
            String dataCerta = ano + "/"+mes +"/"+ dia;
            System.out.print(dataCerta);
            
            
           pet.setNome(request.getParameter("titulo"));
           pet.setDtNascimento(dataCerta);
           pet.setTipo(request.getParameter("categoria"));
           pet.setPorte(request.getParameter("porte"));
           pet.setRaca(request.getParameter("raca"));
           pet.setObs(request.getParameter("observacao"));
           
           int id=0;
           for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idCliente")) {
                    id = Integer.parseInt(cookie.getValue());

                }                
            }
           PetDAO.addPet(pet, id);
           //response.sendRedirect("jsp/Home.jsp?status=Okp");
           response.sendRedirect("jsp/CadastroPetImagem.jsp?status=OK&id="+pet.getIdPet());
           
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
