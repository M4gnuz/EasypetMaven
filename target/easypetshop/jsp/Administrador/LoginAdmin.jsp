<%-- 
    Document   : LoginAdmin
    Created on : Oct 22, 2018, 1:50:05 PM
    Author     : glima
--%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Admin</title>
        <link rel="stylesheet" type="text/css" href="../../css/index.css">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
              crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
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
            <img src="../../ResourcesIm/logoSite.png"/>    
        </div>
        <div class="admin">
            <button class="btn btn-secondary float-right" onclick="window.location.href = '../../'">Voltar</button>    
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div id="loginAdmin" class="principal col-xs-12 col-sm-5 col-md-5">
                <form id="formAdmin" method="POST" action="../../LoginAdminServlet">
                    <h3 class="cadastro">Login Admin</h3>
                    <div class="form-group col-xs-12 col-sm-11 col-md-11" id="login">
                        <label>E-mail:</label>
                        <input type="text" name="login" class="form-control" id="loginInput">
                    </div>                        
                    <div class="form-group col-xs-12 col-sm-11 col-md-11" id="senhaLogin">
                        <label>Senha:</label>
                        <div class="input-group mb-3">
                            <input type="password" name="senha" class="form-control" id="senhaInput">
                        </div>
                    </div>
                    <a id="btn_EsqueciSenha" data-toggle="modal" href="#ModalEsqueciSenha">Esqueci minha senha</a>
                    <br><br>
                    <button type="submit" id="btnLogin" class=" btn2 btn btn-success">Entrar</button>                       
                </form>
            </div>   
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

</div>


<script type="text/javascript" src="js/index.js"></script>
</body>      
</html>
