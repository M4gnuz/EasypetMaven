<%-- 
    Document   : MeusProdutos
    Created on : 01/09/2018, 00:41:36
    Author     : AsColaco
--%>

<%@page import="classes.Cliente"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="classes.Pedido"%>
<%
    String status = request.getParameter("status");
%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="classes.Fornecedor"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="classes.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.AlimentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="servlet.Controle"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%! int contador = 0;%>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Home Fornecedor</title>

        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css">  
        <link rel="stylesheet" type="text/css" href="../css/LojaFornecedor.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <title>Inicio</title>


    </head>
    <body id="tudo">



        <%@include file="cabecalho.jsp"%>
        <%
String media = "";
FornecedorDAO.getFaturamentoTotal(forn, media);
%>
        <!--   
               String nome = "";
               String imagem = "";
   
               for (Cookie cookie : request.getCookies()) {
                   if (cookie.getName().equals("idFornecedor")) {
                       id = Integer.parseInt(cookie.getValue());
   
                   }
                   Fornecedor novo = FornecedorDAO.getFornecedor(id);
                   nome = novo.getNome();
                   imagem = novo.getImagem();
               }
        -->
        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">

            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo">Inicio</h1>
            </div>
        </div>

        <%@include file="menuLateral.jsp"%>


        <div class="principal col-xs-12 col-sm-6 col-md-6">
            <hr>

            <label> Agendamento Recentes</label>
            <table class="table" id="tabela_busca_meus_agendamentos_cliente">
                <thead class="thead-dark">
                    <tr>

                        <th></th>
                        <th scope="col">Cliente</th>
                        <th scope="col"></th>
                        <th scope="col">Pet</th>
                        <th scope="col">Serviço</th>


                        <th scope="col">Data e Horario</th>   
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>                    
                    <tr>
                        <th></th>
                        <th>Ana Julias</th>
                        <th></th>
                        <th>Scooby</th>
                        <th>Banho e Tosa</th>


                        <th>01/12/2018 10hs30</th>
                        <th><a href="">Ver</a></th>
                    </tr>
                    <tr>
                        <th></th>
                        <th>Mariana</th>
                        <th></th>
                        <th>Arturito</th>
                        <th>Banho </th>


                        <th>20/12/2018 19hs30</th>
                        <th><a href="MeusAgendamentosFornecedor.jsp" >Ver</a></th>
                    </tr>
                </tbody>   

            </table><u><a href="">Ver todas</a></u>
            <hr>
            <br>
            <div  class="row cxs"> 

                <div class=" cx1 col-xs-12 col-sm-6 col-md-6">
                    <label style="margin-left: 12%;">  Produtos com Pouco Estoque</label>
                    <table class="table" id="">
                        <thead class="thead-dark">
                            <tr>
                                <th></th>
                                <th scope="col">Produto</th>
                                <th scope="col"></th>
                                <th scope="col">Quantidade</th>
                            </tr>
                        </thead>
                        <tbody> 
                            <%List<Produto> lista = new ArrayList();
                                ProdutoDAO.getProdutos(lista, forn.getId());
                                for (int x = 0; x < lista.size(); x++) {
                                    if (lista.get(x).getEstoque() < 10) {%>    
                            <tr>
                                <th></th>
                                <th scope="col"><%=lista.get(x).getNome()%></th>
                                <th scope="col"></th>
                                <th scope="col"><%=lista.get(x).getEstoque()%></th>
                            </tr>
                            <%}
                                }%>                            

                        </tbody>   

                    </table>
                </div>

                <div class=" cx col-xs-12 col-sm-6 col-md-6">
                    <label style="margin-left: 18%;">  Pedidos em Andamento</label>
                    <table class="table" id="">
                        <thead class="thead-dark">
                            <tr>
                                <th></th>
                                <th scope="col">Nº Pedido</th>
                                <th scope="col"></th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody> 
                            <% List<Pedido> listaPedido = new ArrayList();
                                List<Cliente> listaCliente = new ArrayList();
                                PedidoDAO.getPedidosFornecedor(listaPedido, listaCliente, forn.getId());
                                for (int z = 0; z < listaPedido.size(); z++) {
                            %>
                            <tr>
                                <th></th>
                                <th scope="col"><%=listaPedido.get(z).getIdPedido() + "-" + listaCliente.get(z).getNome()%></th>
                                <th scope="col"></th>
                                <th scope="col"><u><a href="../Controle?id=<%=listaPedido.get(z).getIdPedido()%>&action=verDetalhesFornecedor">Ver</a></u></th>
                        </tr>
                        <%}%>
                        </tbody>   

                    </table>
                    <hr>
                </div>
            </div>
            <hr>
            <h2 style="margin-left: 32%; margin-bottom:15px;"> Faturamento</h2>
            <table class="table" id="tabela_busca_meus_agendamentos_cliente">
                <thead class="thead-dark">
                    <tr>
                        <th></th>
                        <th scope="col">Total de Pedidos</th>
                        <th scope="col"></th>
                        
                        <th scope="col"></th>
                        <th scope="col">Total Faturado</th>  
                        <th scope="col"></th>
                    </tr>
                </thead>
                <tbody>
                    
                    <tr>
                        <th></th>
                        <th scope="col"></th>
                        <th scope="col"></th>
                        <th scope="col"></th>                                             
                        <th scope="col"><%=media%></th>  
                        <th scope="col"></th>
                    </tr>

                </tbody>   
            </table>
        </div> 
        <%@include file="rodape.jsp"%>      

        <script type="text/javascript" charset="utf-8">


        </script>
    </body>
</html>
