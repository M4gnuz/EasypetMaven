
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
        <title>Meus Agendamentos</title>

    </head>
    <body id="tudo">



   

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
                <h1>Teste Pet</h1>
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo">Gerencicar meus Agendamentos</h1>
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
            <table class="table" id="tabela_busca_meus_agendamentos_fornecedor">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">PetShop</th>
                        <th scope="col">Pet</th>
                        <th scope="col">Serviço</th>
                        <th scope="col">Preço</th>
                        <th scope="col">Data</th>
                        <th scope="col">Ação</th>                        
                    </tr>
                </thead>
                <tbody>                    
                    <tr>
                        <th>Pet shop Mania</th>
                        <th>Boomer</th>
                        <th>Banho e Tosa</th>
                        <th>100,00</th>
                        <th>03/11/2018</th>
                        <th>Gerenciar</th>
                    </tr>
                </tbody>                
            </table>

            <br>

        </div> 
        <%@include file="rodape.jsp"%>      

        <script type="text/javascript" charset="utf-8">


            $("#tabela_busca_meus_agendamentos_fornecedor").dataTable({
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
