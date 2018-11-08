<%@page import="classes.Servico"%>
<%@page import="dao.ServicoDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Produto"%>
<%@page import="classes.Produto"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja</title>
        <link rel="stylesheet" type="text/css" href="../css/loja.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



        <script>
            $(function () {
                $("#tabs").tabs();
            });
        </script>
    </head>
    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>

        <%String nome = "";
            String descricao = "";
            String inicio = "";
            String termino = "";
            String foto = "";
            int idForn = Integer.parseInt(request.getParameter("id"));
            Fornecedor forn = FornecedorDAO.getFornecedor(idForn);
            nome = forn.getNome();
            descricao = forn.getDescricao();
            inicio = forn.getInicio();
            termino = forn.getTermino();
            foto = forn.getImagem();
            DecimalFormat df = new DecimalFormat("#.00");
        %>

        <div class="container" id="quemSomos">
            <h1 class="titulo"> <%= nome%></h1>
            <div class="row" id="informacoesFornecedor">
                <div class="col-md-4 col-sm-12">
                    <div class="text-center">
                        <img src="<%= foto%>" class="img-fluid" alt="Imagem responsiva" id="imagem">
                    </div>

                </div>
                <div class="col-md-1 col-sm-12">
                </div>
                <div class="col-md-7 col-sm-12">
                    <h6 id="tituloDescricaodaLoja">Descrição da Loja/Propaganda</h6>
                    <div id="texto">
                        <p>
                            <%= descricao%>
                        </p>    
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-sm-12">
                            <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
                           <div class="estrelas">
                            
                                <label>
                                   <img name="fb" value="1" class="apagada"/>
                               </label>
                               <label>
                                   <img name="fb" value="2" class="apagada"/>
                               </label>
                               <label>
                                   <img name="fb" value="3"  class="apagada"/>
                               </label>
                               <label>
                                   <img name="fb" value="4"  class="apagada"/>
                               </label>
                               <label>
                                   <img name="fb" value="5" class="apagada"/>
                               </label>

                            
                        </div>
                        </div>
                        <div class="col-md-6 col-sm-12">
                            <div id="hAtendimento">
                                <h6>Horário de Atendimento</h6>
                                <p>seg a sex das <%= inicio%> às <%= termino%></p> 
                            </div>  
                        </div>
                    </div>
                </div> 
            </div>


            <div id="tabs">
                <ul>
                    <li><a href="#tabs-1">Produtos</a></li>
                    <li><a href="#tabs-2">Serviços</a></li>

                </ul>
                <div id="tabs-1">

                    <div id="caixaPromocoes">
                        <div class="row">
                            <%
                                List<Produto> lista = new ArrayList();
                                ProdutoDAO.getProdutos(lista, idForn);
                                for (int contador = 0; contador < lista.size(); contador++) {
                                    Produto produto = lista.get(contador);
                            %>
                            <div class="col-md-6 col-sm-12">
                                <div id="produto">
                                    <img src="<%produto.getImagem(); %>" width="100px" height="100px" id="imagemProduto"<%= contador%>>
                                    <p> 
                                        <%= produto.getNome()%>
                                    </p>
                                    <label id="descricaoProduto2">  
                                        <%= produto.getDescricao()%>                                     
                                    </label>
                                    <strong>R$<%= df.format(produto.getPreco())%>.</strong>
                                    <a href="../Controle?id=<%= produto.getId()%>&action=verProduto" id="visualizar">Visualizar Produto</a><br>
                                </div>
                            </div>
                            <% }%>
                        </div>
                    </div>
                </div>

                <div id="tabs-2">

                    <div id="caixaServicos"> 
                        <div class="row">
                            <%
                                List<Servico> lista2 = new ArrayList();
                                ServicoDAO.getProdutos(lista2, idForn);
                                for (int contador = 0; contador < lista.size(); contador++) {
                                    Servico ser = lista2.get(contador);
                            %>
                            <div class="col-md-6 col-sm-12">
                                <div id="servico">
                                    <p id="nomeServico"><%= (ser.getCategoria()+" para "+ser.getAnimal())%></p>
                                    <label id="descricaoServicos">
                                        <%= ("Descrição: "+ser.getDescricao())%>
                                    </label>
                                    <div id="valorServico"><%= ("R$"+df.format(ser.getPreco()+ser.getFrete()))%></div>                                    
                                    <a href="../Controle?id=<%= ser.getId()%>&action=agendarServ" id="linkHorario">Ver horários de agendamento</a> 
                                </div>
                            </div>
                            <% }%>
                        </div>

                    </div>

                </div>
            </div>

        </div>
                        <script type="text/javascript" src="../js/Loja.js" charset="utf-8"></script>
        <br><br><br><br><br><%@include file="rodape.jsp"%>
    </body>
</html>
