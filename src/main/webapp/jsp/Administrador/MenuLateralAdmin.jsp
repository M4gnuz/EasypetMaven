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
                                        onclick="window.location.href = 'AnalyticsAdmin.jsp'">
                                    Análise de Dados
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>  
                    <div class="card" id="cardClientes">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'GerenciarClientes.jsp'">
                                    Gerenciar Clientes
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>                    
                    <div class="card" id="cardFornecedores">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'GerenciarFornecedor.jsp'">
                                    Gerenciar Fornecedores
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card" id="cardhome">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'CadastroAdmin.jsp'">
                                    Cadastrar Administradores
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card" id="cardAssinaturas">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'ControleAssinaturas.jsp'">
                                    Controle de Assinaturas
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card" id="cardPremiacao">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'PremiacaoFornAdmin.jsp'">
                                    Premiação
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card" id="cardTrocaSenha">
                        <div class="card-header" id=" headingOne">
                            <h5 class="mb-0">
                                <button class="btn btn-link" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                                        onclick="window.location.href = 'TrocaSenhaAdmin.jsp'">
                                    Trocar Senha
                                </button>
                            </h5>
                        </div>
                        <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</body>
</html>
