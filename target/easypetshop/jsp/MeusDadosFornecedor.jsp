<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<%String question = request.getParameter("question"); 
    
%>
<html>
    <head>
        <meta charset="UTF-8">
        <title>ALTERAR DADOS FORNECEDOR</title>

        <link rel="stylesheet" type="text/css" href="../css/MeusDadosFornecedor.css">
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>

        <script>
            window.onload = function () {
                $("#inputHorarioInicio").mask("99:99");
                $("#inputHorarioFim").mask("99:99");
            }
        </script>
    </head>
    <body class="tudo">


        <%@include file="cabecalho.jsp"%>
        <%           

           

            String data = forn.getDataAbertura();
            String datanova = "";
            for (int x = 0; x < data.length(); x++) {
                datanova += data.charAt(x);
            }
            String dia = datanova.charAt(8) + "" + datanova.charAt(9);
            String mes = datanova.charAt(5) + "" + datanova.charAt(6);
            String ano = datanova.charAt(0) + "" + datanova.charAt(1) + "" + datanova.charAt(2) + "" + datanova.charAt(3);
            String dataCerta = dia + mes + ano;
        %>


        <div class="container">
            <div id="cadastrar" class="principal col-xs-12 col-sm-8 col-md-8">
                <form action="../AlterarDadosFornecedorServlet" method="post" id="formulario">
                    <h3 class="cadastro">Alteração de Dados</h3>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="nome">
                            <label>Nome Fantasia:</label>
                            <input type="text" name="nome" <% out.print("value='" + forn.getNome() + "'"); %> class="form-control" id="inputNome">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6 " id="razaoSocial">
                            <label>Razão Social:</label>
                            <input type="text" <% out.print("value='" + forn.getRazao() + "'"); %> name="razaoSocial" class="form-control" id="inputRazaoSocial">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-8 col-md-8" id="email" >
                            <label>E-mail:</label>
                            <input type="text" <% out.print("value='" + forn.getEmail() + "'"); %> name="email" class="form-control" id="inputEmail" placeholder="exemplo@hotmail.com" readonly>
                        </div>
                        <div class="form-group col-xs-12 col-sm-4   col-md-4" id="data">
                            <div class="form-group " id="data">
                                <label>Data de abertura:</label>
                                <input type="text" <% out.print("value='" + dataCerta + "'"); %> name="data" class="form-control" id="inputData" readonly>                               
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="senha">
                            <label>Nova Senha:</label>
                            <div class="input-group mb-3">
                                <input type="password" <% out.print("value='" + forn.getSenha() + "'"); %> name="senha" class="form-control" id="inputSenha" maxlength="15">
                                <button type="button" id="btn-modal-senha" class="btn btn-outline-dark">?</button>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="confSenha">
                            <label>Confirma a Senha:</label>
                            <input type="password" <% out.print("value='" + forn.getSenha() + "'"); %> name="confSenha" class="form-control" id="inputConfsenha" maxlength="15">
                        </div>
                    </div>
                    <div class="form-row">

                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="CNPJ">
                            <div class="form-group " id="cnpj">
                                <label>CNPJ:</label>
                                <input type="text" <% out.print("value='" + forn.getCnpj() + "'"); %> name="cnpj" class="form-control" id="inputCnpj" readonly>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-6    col-md-6" id="telefone">
                            <div class="form-group " id="cpf">
                                <label>Telefone:</label>
                                <input type="text" <% out.print("value='" + forn.getTelefone() + "'"); %> name="telefone" class="form-control" id="inputTelefone">

                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="CEP">
                            <div class="form-group" id="cep">
                                <label>CEP:</label>
                                <div class="input-group">
                                    <input type="text" <% out.print("value='" + forn.getCep() + "'"); %> name="cep" class="form-control cep" id="inputCep">
                                </div>
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-9  col-md-9" id="endereco">
                            <div class="form-group " id="endereco">
                                <label>Endereço:</label>
                                <input type="text" <% out.print("value='" + forn.getEndereco() + "'"); %> name="endereco" class="form-control" id="inputEndereco">
                            </div>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-3 col-md-3">
                            <div class="form-group" id="numero">
                                <label>Número:</label>
                                <input type="text" <% out.print("value='" + forn.getNrRua() + "'"); %> name="numero" class="form-control" id="inputNumero">
                            </div>    
                        </div>
                        <div class="form-group col-xs-12 col-sm-9 col-md-9">
                            <div class="form-group" id="complemento">
                                <label>Complemento:</label>
                                <input type="text" <% out.print("value='" + forn.getComplemento() + "'"); %> name="complemento" class="form-control" id="inputComplemento">
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="bairro">
                            <label>Bairro:</label>
                            <input type="text" <% out.print("value='" + forn.getBairro() + "'"); %> name="bairro" class="form-control" id="inputBairro">
                        </div>
                        <div class="form-group col-xs-12 col-sm-6 col-md-6" id="cidade">
                            <label>Cidade:</label>
                            <input type="text" <% out.print("value='" + forn.getCidade() + "'");%> name="cidade" class="form-control" id="inputCidade">
                        </div>
                    </div>
                    <hr>
                    <br>
                    <label>Horário de atendimento</label>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioInicio">
                            <label>Início</label>
                            <input type="text" name="inicioHorario" <% out.print("value='" + forn.getInicio()+ "'"); %> class="form-control" id="inputHorarioInicio">
                        </div>
                        <div class="form-group col-xs-12 col-sm-2 col-md-2" id="horarioFim">
                            <label>Término</label>
                            <input type="text" name="fimHorario" <% out.print("value='" + forn.getTermino()+ "'"); %> class="form-control" id="inputHorarioFim">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-12 col-md-12" id="descricaoFornecedor">
                            <label>Descrição da loja</label>
                            <textarea class="form-control" name="descricaoFornecedor" id="inoutDescricaoFornecedor" rows="4"  maxlength="500" placeholder="Faça um texto de até 500 caracteres para informar sobre sua loja!"><% out.print(forn.getDescricao()); %></textarea>
                        </div>
                    </div>
                </form>

                <div class="form-row botao">
                    <div class="form-group col-xs-12 col-sm-11 col-md-11" id="cidade">
                        <button type="button" id="cancelarCadFornecedor" class=" btn2 btn btn-cancel float-right">Cancelar</button>
                    </div>
                    <div class="form-group col-xs-12 col-sm-1 col-md-1" id="cidade">
                        <button type="button" id="CadastrarFornecedor" class=" btn2 btn btn-success float-right">Salvar</button>
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






            </div>
        </div>
        <%@include file="rodape.jsp"%>
        <script type="text/javascript" src="../js/MeusDadosFornecedor.js" charset="utf-8"></script>
        <script type="text/javascript" charset="utf-8">
             <% if (question != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (question.equals("imagem")) { %>
              var editaImagem = confirm("Gostaria de editar a imagem do produto?");
                if(editaImagem){
                    window.location.href="CadastroDeFornecedorImagem.jsp?status=OKedit&id=<%=id%>";
                }else{
                     window.location.href="MeusProdutos.jsp?status=OKedit";
                }
            <%}%>           
            }
            ;
            <%}%>
            
        </script>

    </body>

</html>
