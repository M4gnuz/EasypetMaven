<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%
    String validacao = request.getParameter("status");
%>

<html>
    <head>
        <meta charset="UTF-8">
        <title>CADASTRO FORNECEDOR</title>

        <link rel="stylesheet" type="text/css" href="../css/cadastroFornecedor.css">
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
                <form action="../CadastroFornecedorServlet" method="post" id="formulario">
                    <h3 class="cadastro">Cadastro de Fornecedor</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="nome">
                            <label>Nome Fantasia:</label>
                            <input type="text" name="nome" class="form-control" id="inputNome">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 " id="razaoSocial">
                            <label>Razão Social:</label>
                            <input type="text" name="razaoSocial" class="form-control" id="inputRazaoSocial">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-8 col-md-8" id="email">
                            <label>E-mail:</label>
                            <input type="text" name="email" class="form-control" id="inputEmail" placeholder="exemplo@hotmail.com">
                        </div>
                        <div class="form-group col-xs-12 col-sm-4   col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de abertura:</label>
                                <input type="text" name="data" class="form-control" id="inputData">                               
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="senha">
                            <label>Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" name="senha" class="form-control" id="inputSenha" maxlength="15">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" name="confSenha" class="form-control" id="inputConfsenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="CNPJ">
                            <div class="form-group " id="cnpj">
                                <label>CNPJ:</label>
                                <input type="text" name="cnpj" class="form-control" id="inputCnpj">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6    col-md-6" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefone">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="CEP">
                            <div class="form-group" id="cep">
                                <label>CEP:</label>
                                <div class="input-group">
                                    <input type="text" name="cep" class="form-control cep" id="inputCep">
                                </div>
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
                        <div class="form-group col-xs-12 col-sm-3 col-md-3">
                            <div class="form-group" id="numero">
                                <label>Número:</label>
                                <input type="text" name="numero" class="form-control" id="inputNumero">
                            </div>    
                        </div>
                        <div class="form-group col-xs-12 col-sm-9 col-md-9">
                            <div class="form-group" id="complemento">
                                <label>Complemento:</label>
                                <input type="text" name="complemento" class="form-control" id="inputComplemento">
                            </div>
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
                    <hr>
                    <br>
                    <label>Horário de atendimento</label>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioInicio">
                            <label>Início</label>
                            <input type="text" name="inicioHorario" class="form-control" id="inputHorarioInicio">
                        </div>
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioFim">
                            <label>Término</label>
                            <input type="text" name="fimHorario" class="form-control" id="inputHorarioFim">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="descricaoFornecedor">
                            <label>Descrição da loja</label>
                            <textarea class="form-control" name="descricaoFornecedor" id="inoutDescricaoFornecedor" rows="4"  maxlength="500" placeholder="Faça um texto de até 500 caracteres para informar sosbre sua loja!"></textarea>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group form-check ">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1">
                            <label class="form-check-label" for="exampleCheck1">Aceitos os Termos de Uso </label>
                            <button type="button" id="btn-termos-uso" class="btn btn-outline-dark">?</button>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck2">
                            <label class="form-check-label" for="exampleCheck2">Pré Requisitos </label>
                            <button type="button" id="btn-pre-requesitos" class="btn btn-outline-dark">?</button>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                            <button type="button" id="cancelarCadFornecedor" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                        </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                            <button type="button" id="CadastrarFornecedor" class=" btn2 btn btn-success float-right">Cadastrar</button>
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

                    </div>
                </div>

                <div id="modalRequisitos" class="modal">
                    <!-- Modal content -->
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <h2>Pré Requisitos</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent urna augue, suscipit non velit non, posuere pretium libero. Cras sodales eleifend nisi. Etiam vestibulum turpis et mi consectetur, varius malesuada lorem elementum. Suspendisse a iaculis odio, sit amet facilisis leo. Phasellus faucibus feugiat dolor, nec condimentum ipsum bibendum in. Curabitur in quam finibus, tincidunt massa a, tincidunt sapien. Aliquam iaculis velit at hendrerit volutpat. In sollicitudin magna nisi, sed aliquet sem dictum id. Cras porttitor in turpis ut vehicula. Aliquam scelerisque lobortis vestibulum. Nam accumsan congue diam eget malesuada.</p>
                        <p>Cras blandit rutrum est. Ut efficitur quam eget magna porta dapibus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Maecenas efficitur sit amet orci quis auctor. In sapien erat, scelerisque imperdiet ex eu, luctus imperdiet metus. Donec eget dolor iaculis risus tempus molestie a in tortor. Nulla ex massa, suscipit nec consequat et, venenatis sed dui. Mauris fermentum magna eu volutpat egestas. Curabitur volutpat risus eget risus vehicula, et rutrum est tempor. Etiam luctus lorem ante, lacinia euismod arcu scelerisque quis.</p>

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

            <% if (validacao.equals("Cnpj")) { %>
                alert("CNPJ ja Cadastrado!");
            <%}%>
            <% if (validacao.equals("Email")) { %>
                alert("Email ja Cadastrado!");
            <%}%>
            }
            ;
            <%}%>


        </script>
        <script type="text/javascript" src="../js/cadastroFornecedor.js" charset="utf-8"></script>
    </body>

</html>
