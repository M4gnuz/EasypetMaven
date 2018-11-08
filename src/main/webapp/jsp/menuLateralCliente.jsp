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
                                        onclick="window.location.href = 'Home.jsp'">
                                    <i class="fas fa-home"></i>  Home
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>

                    <div class="card" id="cardPets">
                        <div class="card-header" id="headingTwo">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                    <i class="fas fa-paw"></i>   Pets
                                </button>
                            </h5>
                        </div>
                        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    <li>
                                        <a id="click" link href="CadastrarPet.jsp">Novo Pet </a>
                                    </li>
                                    <li>
                                        <a link href="MeusPets.jsp"> Meus Pets</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="card" id="cardAgendamento">
                        <div class="card-header" id="headingThree">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseThree" aria-expanded="False" aria-controls="collapseThree" onclick="window.location.href = '../MeusAgendamentosServlet'">
                                    <i class="fas fa-calendar-alt"></i>   Agendamento
                                </button>
                            </h5>
                        </div>
                    </div>
                    <div class="card" id="cardPedido">
                        <div class="card-header" id="headingFour">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseFour" aria-expanded="False" aria-controls="collapseFour"
                                        onclick="window.location.href = 'MeusPedidosCliente.jsp'">
                                    <i class="fas fa-sticky-note"></i>   Pedidos
                                </button>
                            </h5>
                        </div>
                    </div>
                    <div class="card" id="cardAval">
                        <div class="card-header" id="headingFive">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                                    <i class="fas fa-star"></i>   Avaliações
                                </button>
                            </h5>
                        </div>

                    </div>
                    <div class="card" id="cardconfig">
                        <div class="card-header" id="headingSix">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                                    <i class="fas fa-cogs"></i>  Configurações
                                </button>
                            </h5>
                        </div>
                        <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordion">
                            <div class="card-body">
                                <ul>
                                    <li>
                                        <a id="click" link href="MeusDadosCliente.jsp">Alterar Dados </a>
                                    </li>
                                    <li>
                                        <a id="click" link href="DadosFinanceiros.jsp">Dados Financeiros</a>
                                    </li>
                                    <li>
                                        <a id="click" link href="TrocaSenha.jsp">Trocar Senha</a>
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
