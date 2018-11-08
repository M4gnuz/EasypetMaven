

<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Alterar dados Fornecedor</title>

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
                if (cookie.getName().equals("idFornecedor")) {
                    id = Integer.parseInt(cookie.getValue());
                }
            }
        Fornecedor fornecedor = FornecedorDAO.getFornecedor(id);
        %>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo">Alterar dados Fornecedor</h1>
            </div>
        </div>

        <%@include file="MenuLateralAdmin.jsp"%>

        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-7 col-md-7">

                <form action="../../AlterarFornecedorAdminServlet" method="post" id="formulario">
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="nome">
                            <label>Nome Fantasia:</label>
                            <input type="text" name="nome" class="form-control" id="inputNome" value="<%out.print(fornecedor.getNome()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 " id="razaoSocial">
                            <label>Razão Social:</label>
                            <input type="text" name="razaoSocial" class="form-control" id="inputRazaoSocial" value="<%out.print(fornecedor.getRazao()); %>">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-8 col-md-8" id="email">
                            <label>E-mail:</label>
                            <input type="text" name="email" class="form-control" id="inputEmail" value="<%out.print(fornecedor.getEmail()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-4   col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de abertura:</label>
                                 <%
                                String data = fornecedor.getDataAbertura();
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
                                <input type="text" name="data" class="form-control" id="inputData" value="<%= dataCerta %>">                               
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="senha">
                            <label>Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" name="senha" class="form-control" id="inputSenha" maxlength="15" value="<%out.print(fornecedor.getSenha()); %>">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" name="confSenha" class="form-control" id="inputConfsenha" maxlength="15" value="<%out.print(fornecedor.getSenha()); %>">
                        </div>
                    </div>
                    <div class="form-row">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="CNPJ">
                            <div class="form-group " id="cnpj">
                                <label>CNPJ:</label>
                                <input type="text" name="cnpj" class="form-control" id="inputCnpj" value="<%out.print(fornecedor.getCnpj()); %>">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6    col-md-6" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" name="telefone" class="form-control" id="inputTelefone" value="<%out.print(fornecedor.getTelefone()); %>">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="CEP">
                            <div class="form-group" id="cep">
                                <label>CEP:</label>
                                <div class="input-group">
                                    <input type="text" name="cep" class="form-control cep" id="inputCep" value="<%out.print(fornecedor.getCep()); %>">
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-9  col-md-9" id="endereco">
                            <div class="form-group " id="endereco">
                                <label>Endereço:</label>
                                <input type="text" name="endereco" class="form-control" id="inputEndereco" value="<%out.print(fornecedor.getEndereco()); %>">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3">
                            <div class="form-group" id="numero">
                                <label>Número:</label>
                                <input type="text" name="numero" class="form-control" id="inputNumero" value="<%out.print(fornecedor.getNrRua()); %>">
                            </div>    
                        </div>
                        <div class="form-group col-xs-12 col-sm-9 col-md-9">
                            <div class="form-group" id="complemento">
                                <label>Complemento:</label>
                                <input type="text" name="complemento" class="form-control" id="inputComplemento" value="<%out.print(fornecedor.getComplemento()); %>">
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="bairro">
                            <label>Bairro:</label>
                            <input type="text" name="bairro" class="form-control" id="inputBairro" value="<%out.print(fornecedor.getBairro()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="cidade">
                            <label>Cidade:</label>
                            <input type="text" name="cidade" class="form-control" id="inputCidade" value="<%out.print(fornecedor.getCidade()); %>">
                        </div>
                    </div>
                    <hr>
                    <br>
                    <label>Horário de atendimento</label>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioInicio">
                            <label>Início</label>
                            <input type="text" name="inicioHorario" class="form-control" id="inputHorarioInicio" value="<%out.print(fornecedor.getInicio()); %>">
                        </div>
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioFim">
                            <label>Término</label>
                            <input type="text" name="fimHorario" class="form-control" id="inputHorarioFim" value="<%out.print(fornecedor.getTermino()); %>">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="descricaoFornecedor">
                            <label>Descrição da loja</label>
                            <textarea class="form-control" name="descricaoFornecedor" id="inoutDescricaoFornecedor" rows="4"  maxlength="500" ><%out.print(fornecedor.getDescricao()); %></textarea>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                            <button type="button" id="cancelarCadFornecedor" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                        </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                            <button type="button" id="CadastrarFornecedor" class=" btn2 btn btn-success float-right">Alterar</button>
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
        <script type="text/javascript" src="../../js/Administrador/editarFornecedorAdmin.js" charset="utf-8"></script> 
    </body>
</html>
