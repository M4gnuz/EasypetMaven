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
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author glima
 */
@WebServlet(name = "CadastroClienteServlet", urlPatterns = {"/CadastroClienteServlet"})
public class CadastroClienteServlet extends HttpServlet {
     public void converteString(String string) throws UnsupportedEncodingException{
            String encodedWithISO88591 = string;
            String decodedToUTF8 = new String(encodedWithISO88591.getBytes("ISO-8859-1"), "UTF-8");
            }

    Cliente cliente = new Cliente();

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
        response.setContentType("text/html;charset=ISO-8859-1");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String data = request.getParameter("data");
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
            
            String masc = request.getParameter("customRadio");
            String fem = request.getParameter("customRadio");

            String cpf = request.getParameter("cpf");
            String telefone = request.getParameter("telefone");
            String cep = request.getParameter("cep");
            String nrRua = request.getParameter("numero");

            cliente.setNome(request.getParameter("nome"));
            converteString(request.getParameter("nome"));
            cliente.setSobreNome(request.getParameter("sobrenome"));
            cliente.setEmail(request.getParameter("email"));
            cliente.setSenha(request.getParameter("senha"));
            cliente.setCpf(cpf);
            cliente.setTelefone(telefone);
            cliente.setDtNascimento(dataCerta);
            
            if ("M".equals(masc)) {
                cliente.setSexo('M');
            }
            if ("F".equals(fem)) {
                cliente.setSexo('F');
            }
            cliente.setCep(cep);
            cliente.setEndereco(request.getParameter("endereco"));
            cliente.setNrRua(nrRua);
            cliente.setComplemento(request.getParameter("complemento"));
            cliente.setBairro(request.getParameter("bairro"));
            cliente.setCidade("cidade");  
            cliente.setDtNascimento(dataCerta);

             //VALIDANDO CADASTRO CLIENTE no BANCO
            if (ClienteDAO.confereCPF(cliente)) {                
                response.sendRedirect("jsp/CadastroCliente.jsp?status=Cpf");

            } else if(ClienteDAO.confereEmail(cliente)) {                
                response.sendRedirect("jsp/CadastroCliente.jsp?status=Email");

            } else {
                ClienteDAO.addCliente(cliente);
                response.sendRedirect("index.jsp?status=OK");
                out.print("<script type=\'text/javascript\'>");
                out.println("alert('Cadastrado com Sucesso')");
                out.print("</script>");
            }
           
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
