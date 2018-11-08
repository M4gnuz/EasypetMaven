

<%@page import="dao.AdminDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Cliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%String status = request.getParameter("status");
    %>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Gerenciar Clientes</title>

        <link rel="stylesheet" type="text/css" href="../../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/cabecalho.css">  
        <link rel="stylesheet" type="text/css" href="../../css/Administrador/GerenciarClientesFornecedor.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <title>Meus Serviços</title>


    </head>
    <body id="tudo">


        <%@include file="CabecalhoAdmin.jsp"%>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
               

            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo">Gerenciar Clientes</h1>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="principal col-xs-12 col-sm-7 col-md-7">
            <hr>

            <div>
                <div class="col-md-8">

                </div>
                <div class="col-md-4" >

                </div>

            </div>
            <br>
            <table class="table" id="tabela_busca_meus_clientes" style="text-align: center">
                <thead class="thead-dark">
                    <tr>
                        <th style='text-align: center' scope="col">ID</th>
                        <th style='text-align: center' scope="col">Nome</th>
                        <th style='text-align: center' scope="col">CPF</th>                                              
                        <th style='text-align: center' scope="col">Editar</th>
                        <th style='text-align: center' scope="col">Ativar</th>
                        <th style='text-align: center' scope="col">Desativar</th>
                        <th style='text-align: center' scope="col">Status</th>
                    </tr>
                </thead>
                <tbody> 
                   
                     <%
                        List<Cliente> lista = new ArrayList();
                        
                      
                        AdminDAO.getClientes(lista);

                        for (int contador = 0; contador < lista.size(); contador++) {
                            Cliente cliente = lista.get(contador);
                            out.print("<tr>"                                   
                                    + "<td style='text-align: center'>" + cliente.getId() + "</td>"
                                    + "<td style='text-align: center'>" + cliente.getNome() + "</td>"                         
                                    + "<td style='text-align: center'>" + cliente.getCpf()+ "</td>" 
                                    + "<td style='text-align: center'><a href='../../ControleAdmin?id=" + cliente.getId() + "&action=editClienteAdmin 'id='icone-editar" + contador
                                    + "' name='botoes' class='fas fa-user-edit' style='font-size:22px;'</a></td>"
                                    + "<td style='text-align: center'><a href='../../ControleAdmin?id=" + cliente.getId() + "&action=enableCliente' <i 'id='icone-ativar" + contador
                                    + "' class='fas fa-user-check' style='font-size:22px;'></i></a></td>"
                                    + "<td style='text-align: center'><a href='../../ControleAdmin?id=" + cliente.getId() + "&action=disableCliente' <i 'id='icone-desativar" + contador
                                    + "' class='fas fa-user-slash' style='font-size:22px;'></i></a></td>"
                                    +"<td style='text-align: center'>" + cliente.getStatus()+ "</td>"
                                    + "</tr>");
                        }
                    %>
                    
                </tbody>                
            </table>
            <br>

        </div> 
        <%@include file="RodapeAdmin.jsp"%>      

        <script type="text/javascript" charset="utf-8">
           <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("enabled")) { %>
                alert("Cadastro ATIVADO com Sucesso!");                
            <%}%>
            <% if (status.equals("disabled")) {%>
                alert("Cadastro DESATIVADO com Sucesso!!");
                
            <%}%>           
                 window.location.href= "GerenciarClientes.jsp";
            }
            ;
            <%}%>



            $("#tabela_busca_meus_clientes").dataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });
        </script>
    </body>
</html>
