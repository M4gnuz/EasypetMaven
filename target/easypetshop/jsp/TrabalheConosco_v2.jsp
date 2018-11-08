
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% String status = request.getParameter("status");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Trabalhe Conosco</title>
        <link rel="stylesheet" type="text/css" href="../css/TrabalheConosco.css"> 

        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <%
            int n = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("nivel")) {
                    n = Integer.parseInt(cookie.getValue());

                }
            }
            if (n == 1) {
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalhoCliente.css'>");
            } else {
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalho.css'>");
            }
        %>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoAlternado.jsp"%>

        <h3 class="cadastro">Trabalhe Conosco</h3>
        <div class="container">
            <form action="../TrabalheConoscoServlet" method="post" id="formulario">
                <div id="faleConosco" class="principal col-xs-12 col-sm-5 col-md-5">                
                    <h3 class="cadastro">Informações do Interessado</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Nome Completo</label>
                            <input type="text" name="nome" class="form-control" id="inputNomeTC">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Email</label>
                            <input type="text" name="email" class="form-control" id="inputEmailTC">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="telefone">
                            <div class="form-group ">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefoneTC">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" >
                            <label>Área de Interesse</label>
                            <input type="text" name="areaInteresse" class="form-control" id="inputAreaInteresse" maxlength="40">
                        </div>
                    </div>
                </div>
                <div id="" class="principal col-xs-12 col-sm-5 col-md-5">
                    <h3 class="cadastro">Currículo</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Formação acadêmica</label>
                            <input type="text" name="formacao1" class="form-control" id="inputFormacao1TC" placeholder=" 1º formação">
                            <br>
                            <input type="text" name="formacao2" class="form-control" id="inputFormacao2TC" placeholder=" 2º formação">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Experiência Profissional</label>
                            <input type="text" name="experiencia1" class="form-control" id="inputExperiencia1TC" placeholder=" 1º Experiência">
                            <br>
                            <input type="text" name="experiencia2" class="form-control" id="inputExperiencia2TC" placeholder=" 2º Experiência">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label>Idiomas</label>
                            <input type="text" name="idioma1" class="form-control" id="inputIdioma1TC" placeholder=" 1º idioma - nível">
                            <br>
                            <input type="text" name="idioma2" class="form-control" id="inputIdioma2TC" placeholder=" 2º idioma - nível">
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="nome">
                            <label for="exampleFormControlTextarea1" >Informações Complementares: *</label>
                            <textarea class="form-control" name="infoComplementares" id="inputDescricao" rows="5" maxlength="1000" placeholder="Informe mais informações complementares ao seu currículo."></textarea>
                        </div>
                    </div>
                </div>
                <div id="" class=" col-xs-12 col-sm-12 col-md-12">
                    <div class="form-group " id="">
                        <button type="button" id="btn_enviarEC" class=" btn2 btn btn-success float-right">Enviar</button>
                    </div>
                </div>
            </form>
        </div>
        <script type="text/javascript" src="../js/TrabalheConosco.js" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">
            <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("OK")) { %>
                alert("Email enviado com sucesso.\nAgradecemos o contato.");
            <%}%>

            }
            ;
            <%}%>

        </script>
        <%@include file="rodape.jsp"%>
    </body>
</html>
