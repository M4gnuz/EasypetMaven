

<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Análise de Dados</title>

        <link rel="stylesheet" type="text/css" href="../../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/cabecalho.css">  
        <link rel="stylesheet" type="text/css" href="../../css/Administrador/GerenciarClientesFornecedor.css">
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="jquery-1.7.1.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>  
        <script src="../Source Files/jquery-ui.min.js"></script> 
    </head>
    <body id="tudo">


        <%@include file="CabecalhoAdmin.jsp"%>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo">Premiação Fornecedores</h1>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-7 col-md-7">
                <div style="margin-top: 50px;" class="form-row">
                    <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                        <button type="button" id="btnSortear" class="btn btn-success" >Sortear</button>
                        <br>
                         <br>
                        <input type="text" name="ResultadoPremiador" class="form-control" id="inputResultadoPremiador" placeholder="Sorteado..." readonly>
                    </div>
                </div> 
            </div> 

        </div> 	




        <%@include file="RodapeAdmin.jsp"%>      

        <script type="text/javascript" charset="utf-8">

        </script>
        <script type="text/javascript" src="../../js/Administrador/" charset="utf-8"></script> 
    </body>
</html>
