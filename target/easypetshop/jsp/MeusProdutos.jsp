 <%-- 
    Document   : MeusProdutos
    Created on : 01/09/2018, 00:41:36
    Author     : AsColaco
--%>

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
        <title>Meus Produtos</title>

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
        <title>Meus Produtos</title>


    </head>
    <body id="tudo">



        <%@include file="cabecalho.jsp"%>
        <%
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
        %>
        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
                <h4><%=nome%></h4>

            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo">Meus Produtos</h1>
            </div>
        </div>

        <%@include file="menuLateral.jsp"%>

        <div class="principal col-xs-12 col-sm-6 col-md-6">
            <hr>
            <div>
                <div class="col-md-8">
                </div>
                <div class="col-md-4" >

                </div>
            </div>
            <br>
            <table class="table" id="tabela_busca_meus_produtos">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Imagem</th>
                        <th scope="col">ID</th>
                        <th scope="col">Nome</th>
                        <th scope="col">Estoque</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Categoria</th>                        
                        <th scope="col">Excluir</th>
                        <th scope="col">Editar</th>
                    </tr>
                </thead>
                <tbody>                    
                    <%
                        List<Produto> lista = new ArrayList();
                        for (Cookie cookie : request.getCookies()) {
                            if (cookie.getName().equals("idFornecedor")) {
                                id = Integer.parseInt(cookie.getValue());
                            }
                        }
                        DecimalFormat df = new DecimalFormat("#.00");
                        ProdutoDAO.getProdutos(lista, id);

                        for (int contador = 0; contador < lista.size(); contador++) {
                            Produto produto = lista.get(contador);
                            out.print("<tr>"
                                    + "<td scope='row'><img src='" + produto.getImagem() + "' width='100px' height='80px' ></td>"
                                    + "<td style='text-align: center'>" + produto.getId() + "</td>"
                                    + "<td style='text-align: center'>" + produto.getNome() + "</td>"
                                    + "<td style='text-align: center'>" + produto.getEstoque() + "</td>"
                                    + "<td style='text-align: center'>" + df.format(produto.getPreco()) + "</td>"
                                    + "<td style='text-align: center'>" + produto.getCategoria() + "</td>"
                                    + "<td style='text-align: center'><a href='../Controle?id=" + produto.getId() + "&action=del 'id='excluirProd" + contador
                                    + "' name='botoes' class='fas fa-trash-alt' style='font-size:22px;'</a></td>"
                                    + "<td style='text-align: center'><a href='../Controle?id=" + produto.getId() + "&action=alt' <i 'id='editarProd" + contador
                                    + "' class='far fa-edit' style='font-size:22px;'></i></a></td>"
                                    + "</tr>");
                        }
                    %>

                </tbody>                
            </table>

            <br>

        </div> 
        <%@include file="rodape.jsp"%>      

        <script type="text/javascript" charset="utf-8">
            <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("OK")) { %>
                alert("Produto Cadastrado com Sucesso!");
                window.location.href= "MeusProdutos.jsp";
            <%}%>
            <% if (status.equals("Login")) {%>
                alert("BEM VINDO!! <%=nome%>!");
                
            <%}%>
            <% if (status.equals("OKdel")) {%>
                alert("Produto Excluido com Sucesso!");
                
            <%}%>
                <% if (status.equals("OKedit")) {%>
                alert("Produto Alterado com Sucesso!");
               
            <%}%>
            <% if (status.equals("OKeditForn")) {%>
                alert("Dados alterados com Sucesso!");
               
            <%}%>
                 window.location.href= "MeusProdutos.jsp";
            }
            ;
            <%}%>

            $("#tabela_busca_meus_produtos").dataTable({
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
