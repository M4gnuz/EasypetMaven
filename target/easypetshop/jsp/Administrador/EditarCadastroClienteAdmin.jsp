

<%@page import="classes.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Alterar dados Cliente</title>

        <link rel="stylesheet" type="text/css" href="../../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../../css/cabecalho.css">  
        <link rel="stylesheet" type="text/css" href="../../css/Administrador/alterarDadosClienteFornecedorAdmin.css">
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
        <%        int id=0;    
        for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idCliente")) {
                    id = Integer.parseInt(cookie.getValue());
                }
            }
        Cliente cliente = ClienteDAO.getCliente(id);
        %>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo">Alterar dados Cliente</h1>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-7 col-md-7">

                <form action="../../AlterarClienteAdminServlet" method="post" id="formulario">
                    <div class="form-row">

                        <div class="form-group col-xs-12 col-sm-5 col-md-5" id="nome">
                            <label>Nome:</label>
                            <input type="text" name="nome" class="form-control" id="inputNome" value="<%out.print(cliente.getNome()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-7 col-md-7 " id="sNome">
                            <label>Sobrenome:</label>
                            <input type="text" name="sobrenome" class="form-control" id="inputSNome" value="<%out.print(cliente.getSobreNome()); %>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-8" id="email">
                            <label>E-mail:</label>
                            <input type="text" name="email" class="form-control" id="inputEmail" value="<%out.print(cliente.getEmail()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de Nascimento:</label>
                                <%
                                String data = cliente.getDtNascimento();
                                String inverte="";
                                String dataCerta="";
                                for(int i =0; i<data.length();i++){
                                    if(data.charAt(i)!='-')
                                    inverte += data.charAt(i);
                                }
                                String dia = inverte.charAt(6) + ""+inverte.charAt(7);
                                String mes = inverte.charAt(4) + ""+inverte.charAt(5);
                                String ano = inverte.charAt(0) + ""+inverte.charAt(1)+ "" + inverte.charAt(2) + ""+inverte.charAt(3);
                                dataCerta = dia+""+mes+""+ano;
                                System.out.println(inverte);
                                %>
                                <input type="text" name="data" class="form-control" id="inputData" value="<%= dataCerta%>">
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="senha">
                            <label>Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" name="senha" class="form-control" id="inputSenha" maxlength="15" value="<%out.print(cliente.getSenha()); %>">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" name="confSenha" class="form-control" id="inputConfirmasenha" maxlength="15" value="<%out.print(cliente.getSenha()); %>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-5" id="CPF">
                            <div class="form-group " id="cpf">
                                <label>CPF:</label>
                                <input type="text" name="cpf" class="form-control" id="inputCpf" maxlength="11" value="<%out.print(cliente.getCpf()); %>"> 
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-12    col-md-4" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefone" value="<%out.print(cliente.getTelefone()); %>">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-2" id="sexo">
                            <div class="form-group " id="sexo">
                                <label>Sexo:</label>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" value="M" <%if(cliente.getSexo()=='M'){out.print("checked=''");}%>>
                                    <label class="custom-control-label" for="customRadio1">Masculino</label>
                                </div>
                                <div class="custom-control custom-radio">
                                    <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" value="F"<%if(cliente.getSexo()=='F'){out.print("checked=''");}%>>
                                    <label class="custom-control-label" for="customRadio2">Feminino</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12  col-md-3" id="cep">
                            <label>CEP:</label>
                            <div class="input-group">
                                <input type="text" name="cep" class="form-control cep" id="inputCep" value="<%out.print(cliente.getCep()); %>">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-9  col-md-9" id="endereco">
                            <div class="form-group " id="endereco">
                                <label>Endereço:</label>
                                <input type="text" name="endereco" class="form-control" id="inputEndereco" value="<%out.print(cliente.getEndereco()); %>">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="numero">
                            <label>Número:</label>
                            <input type="text" name="numero" class="form-control" id="inputNumero" maxlength="10" value="<%out.print(cliente.getNrRua()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-9   col-md-9" id="complemento">
                            <label>Complemento:</label>
                            <input type="text" name="complemento" class="form-control" id="inputComplemento" value="<%out.print(cliente.getComplemento()); %>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="bairro">
                            <label>Bairro:</label>
                            <input type="text" name="bairro" class="form-control" id="inputBairro" value="<%out.print(cliente.getBairro()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="cidade">
                            <label>Cidade:</label>
                            <input type="text" name="cidade" class="form-control" id="inputCidade" value="<%out.print(cliente.getCidade()); %>">

                        </div>
                    </div>
                    <br>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                            <button type="button" id="cancelarCadCliente" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                        </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                            <button type="button" id="Cadastrar" class=" btn2 btn btn-success float-right">Enviar</button>
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
        <script type="text/javascript" src="../../js/Administrador/editarClienteAdmin.js" charset="utf-8"></script> 
    </body>
</html>
