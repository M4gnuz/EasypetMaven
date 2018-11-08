<%-- 
    Document   : menuLateral
    Created on : 31/08/2018, 20:54:09
    Author     : logonlb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container" id="caixa1">
            <div class="principal col-xs-12 col-sm-4 col-md-4">
                <div id="accordion">
                    <div class="card" id="cardhome">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'LojaFornecedor.jsp'">
                                    <i class="fas fa-store-alt"></i> Home - Controle Loja
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card" id="cardProduto">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                  <i class="fas fa-box-open"></i>  Produtos
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    <li>
                                        <a id="click" link href="CadastroAlimento.jsp">Novo Produto Alimentício </a>
                                    </li>
                                    <li>
                                        <a id="click" link href="CadastroAcessorio.jsp">Novo  Produto Diversos </a>
                                    </li>
                                    <li>
                                        <a link href="MeusProdutos.jsp"> Gerenciar Produtos</a>
                                    </li>

                                    <!--
                                    <li>
                                        <a link href=""> Categorias</a>
                                    </li>
                                    -->
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card" id="cardProduto">
                        <div class="card-header" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                  <i class="fas fa-hands-helping"></i>  Serviços
                                </button>
                            </h5>
                        </div>
                        <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    <li>
                                        <a id="click" link href="CadastroServico.jsp">Novo Serviço </a>
                                    </li>
                                    <li>
                                        <a link href="MeusServicos.jsp"> Meus Serviços</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card" id="cardAgendamento">
                        <div class="card-header" id="headingFive">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFive" aria-expanded="False" aria-controls="collapseFive"
                                        onclick="window.location.href = 'MeusAgendamentosFornecedor.jsp'">
                                <i class="fas fa-calendar-alt"></i>  Agendamento
                                </button>
                            </h5>
                        </div>
                    </div>
                    <div class="card" id="cardPedido">
                        <div class="card-header" id="headingSix">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseSix" aria-expanded="False" aria-controls="collapseSix"
                                        onclick="window.location.href = 'MeusPedidosFornecedor.jsp'">
                                  <i class="fas fa-sticky-note"></i>  Pedidos
                                </button>
                            </h5>
                        </div>
                    </div>
                    <div class="card" id="cardAval">
                        <div class="card-header" id="headingSeven">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
                                <i class="fas fa-star"></i>    Avaliações
                                </button>
                            </h5>
                        </div>

                    </div>
                    <div class="card" id="cardconfig">
                        <div class="card-header" id="headingEight">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseEight" aria-expanded="false" aria-controls="collapseEight">
                                   <i class="fas fa-cogs"></i> Configurações
                                </button>
                            </h5>
                        </div>
                        <div id="collapseEight" class="collapse" aria-labelledby="headingEight" data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    <li>
                                        <a id="click" link href="MeusDadosFornecedor.jsp">Alterar Dados </a>
                                    </li>
                                    <li>
                                        <a id="click" link href="TrocaSenhaFornecedor.jsp">Trocar Senha</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
