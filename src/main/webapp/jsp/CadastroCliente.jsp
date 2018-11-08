
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<% String validacao = request.getParameter("status");%>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>CADASTRO CLIENTE</title>
        <link rel="stylesheet" type="text/css" href="../css/cadastroFornecedor.css"> 
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script type="text/javascript" src="jquery-1.7.1.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>  
        <script src="../Source Files/jquery-ui.min.js"></script> 

    </head>
    <body>
        <nav class="navbar navbar-expand-lg  border border-dar rounded shadow p-3 mb-5">
            <div class="logo">
                <h3 >EasyPet</h3>
                <img src="../ResourcesIm/logoSite.png" width="88px"/>    
            </div>
        </nav>
        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-9 col-md-9">

                <form action="../CadastroClienteServlet" method="post" id="formulario">
                    <h3 class="cadastro">Alteração de Dados</h3>
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
                            <input type="text" name="email" class="form-control" id="inputEmail" placeholder="exemplo@hotmail.com">
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
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12  col-md-3" id="cep">
                            <label>CEP:</label>
                            <div class="input-group">
                                <input type="text" name="cep" class="form-control cep" id="inputCep">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-9  col-md-9" id="endereco">
                            <div class="form-group " id="endereco">
                                <label>Endereço:</label>
                                <input type="text" name="endereco" class="form-control" id="inputEndereco">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="numero">
                            <label>Número:</label>
                            <input type="text" name="numero" class="form-control" id="inputNumero" maxlength="10">
                        </div>
                        <div class="form-group col-xs-12 col-sm-9   col-md-9" id="complemento">
                            <label>Complemento:</label>
                            <input type="text" name="complemento" class="form-control" id="inputComplemento">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="bairro">
                            <label>Bairro:</label>
                            <input type="text" name="bairro" class="form-control" id="inputBairro">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="cidade">
                            <label>Cidade:</label>
                            <input type="text" name="cidade" class="form-control" id="inputCidade">

                        </div>
                    </div>
                    <br>
                    <div class="form-row">
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Aceitos os Termos de Uso </label>
                            <button type="button" id="btn-termos-uso" class="btn btn-outline-dark">?</button>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                            <button type="button" id="cancelarCadCliente" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                        </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                            <button type="button" id="Cadastrar" class=" btn2 btn btn-success float-right">Enviar</button>
                        </div>
                    </div>    
                </form>


                <!-- The Modal -->
                <div id="modalSenha" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>A senha deverá conter no mínimo 8 caracteres</p>
                    </div>
                </div>

                <!-- The Modal -->
                <div id="modalTermos" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Termos de uso</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna augue, suscipit non velit non, posuere pretium libero. Cras sodales eleifend nisi. Etiam vestibulum turpis et mi consectetur, varius malesuada lorem elementum. Suspendisse a iaculis odio, sit amet facilisis leo. Phasellus faucibus feugiat dolor, nec condimentum ipsum bibendum in. Curabitur in quam finibus, tincidunt massa a, tincidunt sapien. Aliquam iaculis velit at hendrerit volutpat. In sollicitudin magna nisi, sed aliquet sem dictum id. Cras porttitor in turpis ut vehicula. Aliquam scelerisque lobortis vestibulum. Nam accumsan congue diam eget malesuada.</p>
                        <p>Cras blandit rutrum est. Ut efficitur quam eget magna porta dapibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas efficitur sit amet orci quis auctor. In sapien erat, scelerisque imperdiet ex eu, luctus imperdiet metus. Donec eget dolor iaculis risus tempus molestie a in tortor. Nulla ex massa, suscipit nec consequat et, venenatis sed dui. Mauris fermentum magna eu volutpat egestas. Curabitur volutpat risus eget risus vehicula, et rutrum est tempor. Etiam luctus lorem ante, lacinia euismod arcu scelerisque quis.</p>
                        <p>Etiam et ligula diam. Mauris ultrices at est a convallis. Donec a venenatis nibh, eu dignissim lacus. Sed lacinia ac orci eget rutrum. Suspendisse pellentesque metus dolor, non congue nisl consequat eu. In ornare neque et sem elementum fermentum. Curabitur commodo, lacus eget lacinia iaculis, nulla dolor ullamcorper ipsum, sed blandit arcu nibh nec tellus. Aenean vestibulum lorem sit amet ex efficitur luctus. Vestibulum sapien leo, sagittis vel turpis sed, efficitur ornare ex. Proin at massa et purus mattis gravida nec congue enim. Morbi faucibus justo in vulputate rhoncus. Pellentesque ac dui ac augue dapibus ultricies. Aliquam sem elit, sagittis porttitor elit vestibulum, efficitur sagittis purus. Pellentesque ac nibh non dui pellentesque dapibus eget vel risus. Maecenas nulla risus, lacinia vel mollis at, imperdiet ut nulla. Phasellus faucibus fermentum luctus.</p>
                    </div>
                </div>

            </div>

        </div>

        <script type="text/javascript">
            <% if (validacao != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }            
            function validaAlert() {

            <% if (validacao.equals("Cpf")) { %>
                alert("Cpf ja Cadastrado!");
            <%}%>
            <% if (validacao.equals("Email")) { %>
                alert("Email ja Cadastrado!");
            <%}%>
            }
            ;
            <%}%>
        </script>
        <script type="text/javascript" src="../js/cadastroCliente.js" charset="utf-8"></script> 
    </body>

</html>
