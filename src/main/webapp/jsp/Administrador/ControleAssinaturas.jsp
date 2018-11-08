

<%@page import="dao.AdminDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Cliente"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Controle Assinaturas</title>

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
                <h1 id="nomeTopo">Pagamentos das Assinaturas </h1>
                <br>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="principal col-xs-12 col-sm-6 col-md-6">
            <hr>

            <div>
                <div class="col-md-8">

                </div>
                <div class="col-md-4" >

                </div>

            </div>
            <br>
            <table class="table" id="tabela_busca_assinaturas" style="text-align: center">
                <thead class="thead-dark">
                    <tr>
                        <th style='text-align: center' scope="col">ID</th>
                        <th style='text-align: center' scope="col">Nome</th>
                        <th style='text-align: center' scope="col">CNPJ</th>  
                        <th style='text-align: center' scope="col">Situação</th> 

                    </tr>
                </thead>
                <tbody> 
                    <tr>
                        <td>1</td>
                        <td>Fornecedor Teste</td>
                        <td>11.111.111/1111-11</td>
                        <td>Pendente</td>
                    </tr>
                    <tr>
                         <td>2</td>
                        <td>Fornecedor Teste 2</td>
                        <td>22.222.222/2222-22</td>
                        <td>Pago</td>
                    </tr>


                </tbody>                
            </table>
            <br>

        </div> 
        <%@include file="RodapeAdmin.jsp"%>      

        <script type="text/javascript" charset="utf-8">





            $("#tabela_busca_assinaturas").dataTable({
                "language": {
                    "url": "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
                }
            });
        </script>
    </body>
</html>
