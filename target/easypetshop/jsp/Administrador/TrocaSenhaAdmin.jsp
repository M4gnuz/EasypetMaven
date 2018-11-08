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
        <title>Troca Senhas</title>
        <link rel="stylesheet" type="text/css" href="../../css/trocaSenha.css">    
        <link rel="stylesheet" type="text/css" href="../../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/cabecalhoCliente.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoAdmin.jsp"%>
        <div class="container">
            <form action="../../TrocaSenhaAdminServlet" method="post" id="formulario">
                <div id="trocaSenha" class="principal col-xs-12 col-sm-4 col-md-4">                
                    <h3 class="cadastro">Troca Senha</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Senha Antiga</label>
                            <input type="password" name="inputAntigaSenha" class="form-control" id="inputAntigaSenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Nova Senha</label>
                            <input type="password" name="inputNovaSenha" class="form-control" id="inputNovaSenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="telefone">                        
                            <label>Nova Senha Confirmação</label>
                            <input type="password" name="inputNovaSenhaConfir" class="form-control" id="inputNovaSenhaConfir" maxlength="15">                         
                        </div>
                    </div>
                    <div id="" class=" form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12">
                            <button type="button" id="btn_salvarNovaSenha" class=" btn2 btn btn-success float-right">Salvar</button>                      
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-12">
                            <button type="button" id="cancelar" class=" btn2 btn btn-cancel float-right" onclick="window.location.href = 'AnalyticsAdmin.jsp'">Voltar</button>                      
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="../../js/trocaSenha.js" charset="utf-8"></script>
        <%@include file="RodapeAdmin.jsp"%>
    </body>
</html>
