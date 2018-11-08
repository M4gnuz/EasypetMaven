
<%@page import="classes.Fornecedor"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.PedidoDAO"%>
<%@page import="classes.ItemPedido"%>
<%@page import="classes.Pedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Meus Agendamentos</title>

        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css">  
        <link rel="stylesheet" type="text/css" href="../css/meusProdutos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <title>Meus pedidos</title>

    </head>
    <body id="tudo">



        <%@include file="CabecalhoCliente.jsp"%>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo" class="pedidosCli">Acompanhar meus Pedidos</h1>
            </div>
        </div>

        <%@include file="menuLateralCliente.jsp"%>

        <div class="principal col-xs-12 col-sm-6 col-md-6">
            <hr>
            <div>
                <div class="col-md-8">
                </div>
                <div class="col-md-4" >

                </div>
            </div>
            <br>
            <table class="table pedidosCliente" id="tabela_busca_meus_pedidos_cliente">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Pedido</th>
                        <th scope="col">Total</th>
                        <th scope="col">Loja</th>
                        <th scope="col">Status</th>
                        <th scope="col">Ação</th>  
                    </tr>
                </thead>
                <tbody>                    
                    
                    <%
                        List<Pedido> lista = new ArrayList();
                        for (Cookie cookie : request.getCookies()) {
                            if (cookie.getName().equals("idCliente")) {
                                id = Integer.parseInt(cookie.getValue());
                            }
                        }
                        PedidoDAO p = new PedidoDAO();
                        Pedido pedido = new Pedido();
                        DecimalFormat df = new DecimalFormat("#.00");
                        Fornecedor forn = new Fornecedor();
                        //lista com os pedidos
                        p.getAllPedidosCliente(lista, id, forn);
                        
                        
                        for (int contador = 0; contador < lista.size(); contador++) {
                            Pedido p2 = lista.get(contador);
                            pedido = p.getPedido(p2.getIdPedido());
                            out.print("<tr>"
                                    + "<td style='text-align: center'>" + p2.getIdPedido() + "</td>"
                                    + "<td style='text-align: center'>" + df.format(pedido.getTotal())+ "</td>"
                                    + "<td style='text-align: center'>" + forn.getNome() + "</td>"
                                    + "<td style='text-align: center'>" + p2.getStatus() + "</td>"
                                    + "<td style='text-align: center'><a href='../Controle?id=" + p2.getIdPedido()+ "&action=verDetalhesCliente'id='verDetalhes" + contador
                                    + "' name='botoes' style='font-size:22px;'</a>Detalhes</td>"
                                    + "</tr>");
                        }
                    %>
                </tbody>                
            </table>

            <br>

        </div> 
        <%@include file="rodape.jsp"%>      

        <script type="text/javascript" charset="utf-8">


            $("#tabela_busca_meus_pedidos_cliente").dataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });
            /*produtos.sort(function(a,b) {
             return a.nome < b.nome ? -1 : a.nome > b.nome ? 1 : 0;
             });*/

        </script>
    </body>
</html>
