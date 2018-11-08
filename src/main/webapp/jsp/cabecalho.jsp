<%-- 
    Document   : cabecalho
    Created on : 31/08/2018, 20:37:11
    Author     : logonlb
--%>

<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%
            int id =0;
            for (Cookie cookie : request.getCookies()) {
                                if (cookie.getName().equals("idFornecedor")) {
                                    id = Integer.parseInt(cookie.getValue());
                                }
                            }
            Fornecedor forn = FornecedorDAO.getFornecedor(id);
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

    <nav id="nav-principal" class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-3">
        <div class="logo">
            <h3>EasyPet</h3>
            <img src="../ResourcesIm/logoSite.png" width="88px">        
        </div>
        <div class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group mr-2" role="group" aria-label="First group">
                <div class="dropdown">
                    <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Sobre
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="QuemSomos.jsp">Quem Somos</a>
                        <a class="dropdown-item" href="TermosECondicoes.jsp">Termos Condições e Uso</a>
                        <a class="dropdown-item" href="PoliticaDePrivacidade.jsp">Privacidade</a>                        
                    </div>
                  </div>
                  <div class="dropdown">
                    <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      Contato
                    </button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="FaleConosco.jsp">Fale Conosco</a>
                        <a class="dropdown-item" href="TrabalheConosco_v2.jsp">Trabalhe Conosco</a>
                      <a class="dropdown-item" href="ComoPedir.jsp">Como Pedir</a>
                    </div>
                  </div>
                <div class="dropdown">
                        <button id="menuFornecedor" class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-alt"></i>
                            <% out.print(forn.getNome()); %>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="MeusProdutos.jsp">Meus Produtos</a>
                            <a class="dropdown-item" href="MeusServicos.jsp">Meus Serviços</a>   
                            <a class="dropdown-item" href="../index.html">Sair</a> 
                        </div>
                    </div>
            </div>
        </div>
    </nav>
                        <script type="text/javascript">
                            <% if(forn.getStatus().equals("DESATIVADO")||forn.getStatus()==null){%>
                                window.location.href="msgErro.jsp";
                                <%}%>
                            
                        </script>          
    </body>
    
</html>
