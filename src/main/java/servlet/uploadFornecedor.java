/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import dao.FornecedorDAO;
import dao.ProdutoDAO;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URL;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.misc.BASE64Decoder;

/**
 *
 * @author glima
 */
public class uploadFornecedor extends HttpServlet {
     public String decodeToImage(String imageString, int idFornecedor) {
        String path = "";
        BufferedImage image = null;
        byte[] imageByte;
        try {
            //o método recebe um string base 64 e converte para array de bytes
            BASE64Decoder decoder = new BASE64Decoder();
            imageByte = decoder.decodeBuffer(imageString);
            ByteArrayInputStream bis = new ByteArrayInputStream(imageByte);
            image = ImageIO.read(bis);
            
            //o array de bytes converte em um arquivo novamente.
            BufferedImage img = new BufferedImage(image.getWidth(null), image.getHeight(null), BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = img.createGraphics();
            g2d.drawImage(image, 0, 0, null);
            g2d.dispose();
            
            //pegamos o caminho da classe upload(this), e cortamos para direcionar para pasta de imagens.
            URL caminho = getClass().getResource("upload.class");;
            int indice = caminho.toString().indexOf("target");
            String projectPath = caminho.toString().substring(5, indice); 
            
            //escrevemos o caminho e o nome do arquivo como deve ser.
            File imgOutFile = new File(projectPath + "src\\main\\webapp\\ImagemProduto/imgFornecedor-" + idFornecedor + ".jpeg");
            System.out.print("DIRETÓRIO:    " + imgOutFile.getAbsolutePath());            
            ImageIO.write(image, "png", imgOutFile);
            String diretorio = imgOutFile.getAbsolutePath();           
            
            path = diretorio;
            bis.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return path;
    }

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
            String status = request.getParameter("status");
            String foto = request.getParameter("upload");
                        
            int idFornecedor = Integer.parseInt(request.getParameter("id"));
            
            String imagem = decodeToImage(foto, idFornecedor);

            String[] vetor = imagem.replace("\\", "/").split("/");
            int ultimo = vetor.length-1;
            int penultimo = vetor.length-2;
            String exibir2 = "../" + penultimo + "/" + ultimo;
            System.out.println("VETOR:    " + exibir2);
           
            //ADICIONAR IMAGEM AO FORNECEDOR
            FornecedorDAO.addImagem(idFornecedor, exibir2);
            if(status!=null && status.equals("OK")){
                response.sendRedirect("jsp/Assinatura.jsp");
                
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
