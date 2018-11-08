<%-- 
    Document   : TrocaSenha
    Created on : 24/09/2018, 20:29:14
    Author     : AsColaco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dados financeiros</title>
        <link rel="stylesheet" type="text/css" href="../css/dadosFinanceiros.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>
        <div class="container">
            <form action="../" method="post" id="formulario">
                <div id="dadosFinanceiros">                               
                    <div class="row">                        
                        <div id="opcoesPagamento" class="principal col-xs-12 col-sm-6 col-md-6">
                            <br>
                            <h3 class="cadastro">Dados financeiros</h3>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-xs-12 col-sm-5 col-md-5">
                                    <label>Numero do cartão:</label>
                                    <input type="text" name="nrCartao" class="form-control" id="inputNumeroCartao">
                                </div>
                                <div class="form-group col-xs-12 col-sm-7 col-md-7 " id="sNome">
                                    <label>Nome impresso no cartão:</label>
                                    <input type="text" name="nomeImpresso" class="form-control" id="inputNome">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-xs-12 col-sm-6 col-md-6">
                                    <label>Validade:</label>
                                    <input type="text" name="validade" class="form-control" id="inputValidade">
                                </div>
                                <div class="form-group col-xs-12 col-sm-4 col-md-4 " id="sNome">
                                    <label>Código de Segurança:</label>
                                    <input type="text" name="cvv" class="form-control" id="inputCodSeguranca" maxlength="4">
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-xs-12 col-sm-5 col-md-5">
                                    <label>CPF do titular:</label>
                                    <input type="text" name="cpf" class="form-control" id="inputCpf">
                                </div>
                                <div class="form-group col-xs-12 col-sm-2 col-md-2">
                                    <label>Parcelas</label>
                                    <input type="text" name="parcelas" class="form-control" id="inputParcelas" maxlength="2">
                                </div>
                            </div>
                            <div id="" class=" form-row">
                                <div class="form-group col-xs-12 col-sm-10 col-md-10" id="cidade">
                                    <button type="button" id="cancelarfinanceiro" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                                </div>
                                <div class="form-group col-xs-12 col-sm-2 col-md-2">
                                    <button type="button" id="btnSalvarFinanceiro" class=" btn2 btn btn-success float-right">Salvar</button>                      
                                </div>
                            </div>  
                        </div>
                    </div> 
                </div>




            </form>
        </div>
        <br><br><br>
        <script type="text/javascript" src="../js/dadosFinanceiros.js" charset="utf-8"></script>
        <%@include file="rodape.jsp"%>
    </body>
</html>
