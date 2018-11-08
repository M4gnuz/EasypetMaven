

<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Gerenciar Clientes</title>

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
                <h1 id="nomeTopo">Cadastrar Administrador</h1>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-7 col-md-7">

                <form action="../../CadastroAdminServlet" method="post" id="formulario">
                    <div class="form-row">

                        <div class="form-group col-xs-12 col-sm-5 col-md-5" id="nome">
                            <label>Nome:</label>
                            <input type="text" name="nome" class="form-control" id="inputNome">
                        </div>
                        <div class="form-group col-xs-12 col-sm-7 col-md-7 " id="sNome">
                            <label>Sobrenome:</label>
                            <input type="text" name="sobrenome" class="form-control" id="inputSNome">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-8" id="email">
                            <label>E-mail:</label>
                            <input type="text" name="email" class="form-control" id="inputEmail" placeholder="exemplo@admin.com">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de Nascimento:</label>
                                <input type="text" name="data" class="form-control" id="inputData">
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="senha">
                            <label>Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" name="senha" class="form-control" id="inputSenha" maxlength="15">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" name="confSenha" class="form-control" id="inputConfirmasenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-5" id="CPF">
                            <div class="form-group " id="cpf">
                                <label>CPF:</label>
                                <input type="text" name="cpf" class="form-control" id="inputCpf" maxlength="11"> 
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12    col-md-4" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefone">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-2" id="sexo">
                            <div class="form-group " id="sexo">
                                <label>Sexo:</label>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="M">
                                    <label class="custom-control-label" for="customRadio1">Masculino</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="F">
                                    <label class="custom-control-label" for="customRadio2">Feminino</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                            <button type="button" id="cancelarAdmin" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                        </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                            <button type="button" id="cadastrarAdmin" class=" btn2 btn btn-success float-right">Cadastrar</button>
                        </div>
                    </div>    
                </form>


            </div>

        </div> 	

        <!-- The Modal -->
        <div id="modalSenha" class="modal">
            <!-- Modal content -->
            <div class="modal-content">
                <span class="close">&times;</span>
                <p>A senha deverá conter no mínimo 8 caracteres</p>
            </div>
        </div>




        <%@include file="RodapeAdmin.jsp"%>      

        <script type="text/javascript" charset="utf-8">

        </script>
        <script type="text/javascript" src="../../js/Administrador/cadastroAdmin.js" charset="utf-8"></script> 
    </body>
</html>
