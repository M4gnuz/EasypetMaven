
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% String status = request.getParameter("status");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Fale Conosco</title>
        <link rel="stylesheet" type="text/css" href="../css/FaleConosco.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <% 
        int n = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("nivel")) {
                    n = Integer.parseInt(cookie.getValue());

                }                
            }      
            if(n == 1){
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalhoCliente.css'>");
            }
            else{
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalho.css'>");
            }
        %>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoAlternado.jsp"%>
        <div class="container">
            <form action="../FaleConoscoServlet" method="post" id="formulario">
                <div id="faleConosco" class="principal col-xs-12 col-sm-5 col-md-5">                
                    <h3 class="cadastro">Fale Conosco</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Nome Completo</label>
                            <input type="text" name="nome" class="form-control" id="inputNome">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" id="inputEmail">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefone">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" >
                                <label>Assunto</label>
                                <input type="text" name="assunto" class="form-control" id="inputAssunto">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" >
                                <label>Motivo:</label>
                                <input type="text" name="motivo" class="form-control" id="inputMotivo">
                        </div>
                    </div>
                </div>
                <div id="" class="principal col-xs-12 col-sm-5 col-md-5">
                    <div class="form-group col-xs-12 col-sm-10 col-md-10" id="descri">
                        <br>
                        <label for="exampleFormControlTextarea1" >Deixe aqui sua mensagem:</label>
                        <textarea class="form-control" name="mensagem" id="inputDescricao" rows="15" maxlength="1000" placeholder="Faça uma descrição do produto com até 1000 caracteres."></textarea>
                    </div>
                </div>
                <div id="" class=" col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group col-xs-12 col-sm-12 col-md-12">
                        <button type="button" id="btn_enviarFormularioDeDuvidas" class=" btn2 btn btn-success float-right">Enviar</button>                      
                    </div>

                </div>
            </form>
        </div>
        <script type="text/javascript" src="../js/FaleConosco.js" charset="utf-8"></script>
         <script type="text/javascript" charset="utf-8">
            <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("OK")) { %>
                alert("Sua mensagem foi enviada a nossa equipe para analise.");
            <%}%>
           
            }
            ;
            <%}%>
            
        </script>
        <%@include file="rodape.jsp"%>
    </body>
</html>
