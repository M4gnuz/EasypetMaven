<%@page import="dao.ClienteDAO"%>
<%@page import="classes.Cliente"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>
    <head>
        <meta charset="UTF-8">
        <title>ALTERAR DADOS CLIENTE</title>

        <link rel="stylesheet" type="text/css" href="../css/MeusDadosCliente.css">
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css"> 
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>
        

    </head>
    <body class="tudo">
        
        
        <%@include file="CabecalhoCliente.jsp"%>
   <%      
            
            String data = novo.getDtNascimento();
            String datanova = "";
            for(int x = 0; x<data.length();x++){
               datanova+=data.charAt(x);
            }
            String dia=datanova.charAt(8)+""+datanova.charAt(9);
            String mes =datanova.charAt(5)+""+datanova.charAt(6);
            String ano =datanova.charAt(0)+"" + datanova.charAt(1)+"" + datanova.charAt(2)+"" + datanova.charAt(3);
            String dataCerta = dia + mes + ano;
            %>
       

 <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-9 col-md-9">

                <form action="../AlterarDadosClienteServlet" method="post" id="formulario">
                    <h3 class="cadastro">Alterar Dados</h3>
                    <div class="form-row">

                        <div class="form-group col-xs-12 col-sm-5 col-md-5" id="nome">
                            <label>Nome:</label>
                            <input type="text" name="nome" <% out.print("value='" + novo.getNome() + "'"); %> class="form-control" id="inputNome" readonly>
                        </div>
                        <div class="form-group col-xs-12 col-sm-7 col-md-7 " id="sNome">
                            <label>Sobrenome:</label>
                            <input type="text" name="sobrenome" <% out.print("value='" + novo.getSobreNome()+ "'"); %> class="form-control" id="inputSNome" readonly>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-8" id="email">
                            <label>E-mail:</label>
                            <input type="text" name="email" <% out.print("value='" + novo.getEmail()+ "'"); %> class="form-control" id="inputEmail" placeholder="exemplo@hotmail.com">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de Nascimento:</label>
                                <input type="text" name="data" <% out.print("value='" +dataCerta+ "'"); %> class="form-control" id="inputData" readonly>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="senha">
                            <label>Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" name="senha" <% out.print("value='" + novo.getSenha()+ "'"); %> class="form-control" id="inputSenha" maxlength="15">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" name="confSenha" <% out.print("value='" + novo.getSenha()+ "'"); %> class="form-control" id="inputConfirmasenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-5" id="CPF">
                            <div class="form-group " id="cpf">
                                <label>CPF:</label>
                                <input type="text" name="cpf" <% out.print("value='" + novo.getCpf()+ "'"); %>class="form-control" id="inputCpf" maxlength="11" readonly> 
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12    col-md-4" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" <% out.print("value='" + novo.getTelefone()+ "'"); %> class="form-control" id="inputTelefone">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-2" id="sexo">
                            <div class="form-group " id="sexo">
                                <label>Sexo:</label>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="M" <% if(novo.getSexo() == 'M') out.print("checked='true'"); %>>
                                    <label class="custom-control-label" for="customRadio1">Masculino</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="F" <% if(novo.getSexo() == 'F') out.print("checked='true'"); %>>
                                    <label class="custom-control-label" for="customRadio2">Feminino</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12  col-md-3" id="cep">
                            <label>CEP:</label>
                            <div class="input-group">
                                <input type="text" name="cep" <% out.print("value='" + novo.getCep()+ "'"); %> class="form-control cep" id="inputCep">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-9  col-md-9" id="endereco">
                            <div class="form-group " id="endereco">
                                <label>Endereço:</label>
                                <input type="text" name="endereco" <% out.print("value='" + novo.getEndereco()+ "'"); %> class="form-control" id="inputEndereco">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="numero">
                            <label>Número:</label>
                            <input type="text" name="numero" <% out.print("value='" + novo.getNrRua()+ "'"); %> class="form-control" id="inputNumero" maxlength="10">
                        </div>
                        <div class="form-group col-xs-12 col-sm-9   col-md-9" id="complemento">
                            <label>Complemento:</label>
                            <input type="text" name="complemento" <% out.print("value='" + novo.getComplemento()+ "'"); %> class="form-control" id="inputComplemento">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="bairro">
                            <label>Bairro:</label>
                            <input type="text" name="bairro" <% out.print("value='" + novo.getBairro()+ "'"); %> class="form-control" id="inputBairro">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="cidade">
                            <label>Cidade:</label>
                            <input type="text" name="cidade" <% out.print("value='" + novo.getCidade()+ "'"); %> class="form-control" id="inputCidade">
                        </div>
                    </div>
                    <br>
                   
                   
                </form>
 <div class="form-row botao">
                         <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                                <button type="button" id="cancelarCadCliente" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                            </div>
                            <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                                <button type="button" id="Cadastrar" class=" btn2 btn btn-success float-right">Salvar</button>
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

                <!-- The Modal -->
               

            </div>

        </div>
<%@include file="rodape.jsp"%>
<script type="text/javascript" src="../js/MeusDadosCliente.js" charset="utf-8"></script>
        
    </body>

</html>
