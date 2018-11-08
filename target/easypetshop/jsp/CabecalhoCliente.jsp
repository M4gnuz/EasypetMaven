<%-- 
    Document   : CabecalhoCliente
    Created on : 07/09/2018, 16:42:11
    Author     : AsColaco
--%>

<%@page import="classes.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int id = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idCliente")) {
                    id = Integer.parseInt(cookie.getValue());

                }
            }

            Cliente novo = ClienteDAO.getCliente(id);
        %>
        <nav id="nav-principal" class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-3">
            <div class="logo">
                <h3>EasyPet</h3>
                <img src="../ResourcesIm/logoSite.png" width="88px">
            </div>
            <div id="cabecalhoMenu" class="btn-toolbar mb-3" role="toolbar" aria-label="Toolbar with button groups">
                <div class="btn-group mr-2" role="group" aria-label="First group">
                    <div class="dropdown">
                        <button id="Comprar" class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Comprar</button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="PaginadeProdutos.jsp">Produtos</a>
                            <a class="dropdown-item" href="PaginadeServicos.jsp">Serviços</a>
                        </div>
                    </div>
                    <div class="dropdown">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Sobre
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="QuemSomos.jsp">Quem Somos</a>
                            <a class="dropdown-item" href="TermosECondicoes.jsp">Termos Condições e Uso</a>
                            <a class="dropdown-item" href="PoliticaDePrivacidade.jsp" >Privacidade</a>                        
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
                        <button id="menuCliente" class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fas fa-user-alt"></i>
                            <% out.print(novo.getNome()); %>
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="MeusDadosCliente.jsp">Editar meu Perfil</a>
                            <a class="dropdown-item" href="TrocaSenha.jsp">Trocar Senha</a>
                            <a class="dropdown-item" href="MeusPets.jsp">Gerenciar meus Pets</a>
                            <a class="dropdown-item" href="MeusPedidosCliente.jsp">Acompanhar meus pedidos</a>
                            <a class="dropdown-item" href="../MeusAgendamentosServlet">Acompanhar meus agendamentos</a>
                            <a class="dropdown-item" href="../index.html">Sair</a> 
                        </div>
                    </div>
                    <button id="btn_carrinho" class="btn btn-success" type="button" onclick="window.location.href = 'Carrinho.jsp';" >
                        <i class="fas fa-shopping-cart"></i>
                    </button>

                </div>
            </div>
        </nav>
        <script type="text/javascript">
            <% if (novo.getStatus().equals("DESATIVADO") || novo.getStatus() == null) {%>
            window.location.href = "msgErro.jsp";
            <%}%>

            $(function () {
                $(".logo").click(function () {
                    location.href="Home.jsp";
                });
            });



        </script>          
    </body>
</html>
