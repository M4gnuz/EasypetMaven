<!DOCTYPE html>
<%
    String status = request.getParameter("status");
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>BEM-VINDO AO EASYPET!!</title>
        <link rel="stylesheet" type="text/css" href="css/index.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              crossorigin="anonymous">
    <a href="index.html"></a>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" 
    crossorigin="anonymous"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-5">
        <div class="logo">
            <h3 >EasyPet</h3>
            <img src="ResourcesIm/logoSite.png"/>               
        </div>
        <div class="admin">
            <button class="btn btn-secondary float-right" onclick="window.location.href = 'jsp/Administrador/LoginAdmin.jsp'">Admin <i class="fas fa-user"></i></button>    
        </div>
    </nav>
    <div class="container">
        <div id="login" class="principal col-xs-12 col-sm-5 col-md-5">
            <form action="LoginClienteServlet" method="post" id="formLogin">
                <h3 class="cadastro">Cliente</h3>
                <div class="form-group col-xs-12 col-sm-11 col-md-11" id="emailL">
                    <label>E-mail:</label>
                    <input type="text" name="emailL" class="form-control" id="inputEmailLogin">
                </div>                        
                <div class="form-group col-xs-12 col-sm-11 col-md-11" id="senhaLogin">
                    <label>Senha:</label>
                    <div class="input-group mb-3">
                        <input type="password" name="senhaL" class="form-control" id="inputSenhaLogin">
                    </div>
                </div>
                <a id="btn_EsqueciSenha" data-toggle="modal" href="#ModalEsqueciSenha">Esqueci minha senha</a>
                <br><br>
                <a id="click" link href="jsp/CadastroCliente.jsp">Seja nosso Cliente! </a>
                <button type="button" id="entrarCliente" class=" btn2 btn btn-success">Entrar</button>                       
            </form>
        </div>
        <div id="login2" class="principal col-xs-12 col-sm-5 col-md-5">
            <form action="LoginFornecedorServlet" method="post" id="formularioFornecedor">
                <h3 class="cadastro">Fornecedor</h3>


                <div class="form-group col-xs-12 col-sm-11 col-md-11" id="emailLogin">
                    <label>E-mail:</label>
                    <input type="text" name="emailL" class="form-control" id="inputEmailFornecedor">
                </div>

                <div class="form-group col-xs-12 col-sm-11 col-md-11" id="senhaFornecedor">
                    <label>Senha:</label>
                    <div class="input-group mb-3">
                        <input type="password" name="senhaL" class="form-control" id="inputSenhaFornecedor">
                    </div>
                </div>
                <a id="btn_EsqueciSenhaFornecedor" data-toggle="modal" href="#ModalEsqueciSenhaFornecedor">Esqueci minha senha</a>
                <br><br>
                <a id="click" link href="jsp/CadastroFornecedor.jsp">Seja nosso Fornecedor! </a>
                <button type="button" id="entrarFornecedor" class=" btn2 btn btn-success">Entrar</button>
            </form>
        </div>        
    </div>

    <!--Janela modal -->
    <!-- Modal Esqueci minha Senha Cliente-->
    <div class="modal fade" id="ModalEsqueciSenha" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Recuperar Senha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="RecuperarSenhaServlet" method="post">
                        <div class="form-group">       
                            <small id="emailHelp" class="form-text text-muted">Digite seu email para recuperar sua senha.</small>
                            <br>
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" name="emailR" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="exemplo@hotmail.com">
                            <small id="emailHelp" class="form-text text-muted">Em alguns instantes você receberá sua senha por email, pedimos para que troque sua senha após o recebeminto da mesma.</small>
                        </div>
                        <button type="submit" id="btn_enviarSenha" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                </div>
            </div>
        </div>
    </div>

    <!-- Modal Esqueci minha Senha Fornecedor-->
    <div class="modal fade" id="ModalEsqueciSenhaFornecedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">Recuperar Senha</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="RecuperarSenhaServlet" method="post">
                        <div class="form-group">       
                            <small id="emailHelp" class="form-text text-muted">Digite seu email para recuperar sua senha.</small>
                            <br>
                            <label for="exampleInputEmail1">Email</label>
                            <input type="email" name="emailRForn" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="exemplo@hotmail.com">
                            <small id="emailHelp" class="form-text text-muted">Em alguns instantes você receberá sua senha por email, pedimos para que troque sua senha após o recebeminto da mesma.</small>
                        </div>
                        <button type="submit" id="btn_enviarSenhaFornecedor" class="btn btn-primary">Enviar</button>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>

                </div>
            </div>
        </div>
        
    </div>
    

    <script type="text/javascript" src="js/index.js"></script>
    <script type="text/javascript">
                window.onload = function () {
        <% if (status != null) {%>
                    if (window.addEventListener) {
                        window.addEventListener('load', validaAlert());
                    } else {
                        window.attachEvent('onload', validaAlert());
                    }
                    function validaAlert() {

        <%if (status.equals("OK")) { %>
                        alert("Cadastrado com Sucesso");
        <%}%>
        <%if (status.equals("password")) { %>
                        alert("Email de recuperação enviado com sucesso.");
        <%}%>
                    }
                    ;
        <%}%>
                };
    </script>

</body>      
</html>
