<%-- 
    Document   : TermosECondicoes
    Created on : 02/09/2018, 22:45:52
    Author     : AsColaco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Assinatura</title>
        <link rel="stylesheet" type="text/css" href="../css/Assinatura.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoSimples.css"
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="cabecalhoSimples.jsp"%>
        <div class="container">
            <h1 class="titulo">Seja um Assinante!</h1>
            <div id="texto">
                <div class="row"> 
                    <h3> Valor da Assinatura: XX,XX  </h3>
                    <div id="Pagamentotitulo" class="col-xs-12 col-sm-12 col-md-12">
                        <label>Opções de Pagamento</label>
                    </div>    
                    <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">

                        <div class="custom-control custom-radio">
                            <input type="radio" id="rdbCredito" name="customRadio" class="custom-control-input" value="credito"> 
                            <label class="custom-control-label" for="rdbCredito"><i class="fas fa-credit-card"></i> Crédito</label>
                        </div>
                    </div>

                    <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">

                        <div class="custom-control custom-radio">
                            <input type="radio" id="rdbDebito" name="customRadio" class="custom-control-input" value="debito">
                            <label class="custom-control-label" for="rdbDebito"><i class="fas fa-credit-card"></i> Débito</label>
                        </div>
                    </div>
                    <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">
                        <div class="custom-control custom-radio">
                            <input type="radio" id="rdbBoleto" name="customRadio" class="custom-control-input" value="boleto">
                            <label class="custom-control-label" for="rdbBoleto"><i class="far fa-list-alt"></i> Boleto</label>
                        </div>
                    </div>
                </div>
                
                
            </div>
              <div class="form-row botao">
                         <div class="form-group col-xs-12 col-sm-10 col-md-10" id="Cancelar">
                                <button type="button" id="btnVoltar" class="btn btn-success ">Cancelar Cadastro</button>
                            </div>
                             <div class="form-group col-xs-12 col-sm-2 col-md-2" id="Aderir">
                                <button type="button" id="btnAderiro" class="  btn btn-success ">Aderir Assinatura</button>
                            </div>
                    </div>

        </div>
        <%@include file="rodape.jsp"%>
    </body>
</html>
