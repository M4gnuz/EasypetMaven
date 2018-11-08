<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pagina de Serviço</title>
        <link rel="stylesheet" type="text/css" href="../css/paginadeServico.css">  
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

    </head>
    <body id="tudo" class="paginaCarrinho">

        <%@include file="CabecalhoCliente.jsp"%>
        <div id="boxs" class="row" >
            <div id="informacoes" class="col-xs-10 col-sm-8 col-md-8">
                <div class="row">
                    <div id="informacoes" class="col-xs-12 col-sm-10 col-md-10">
                        <h4>Informações da Loja</h4>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>Nome da loja: <label>${fornecedor.nome}</label></p>
                        <p>Mais sobre:  <a href="#">Minha Loja</a> </p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>E-mail: <label>${fornecedor.email}</label></p>
                        <p>Telefone: <label>${fornecedor.telefone}</label></p>
                        <p>Atendimento <label>08h00 às 18h00</label></p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>Cidade: <label>${fornecedor.cidade}</label></p> 
                        <p>Endereço: <label>${fornecedor.endereco}, ${fornecedor.bairro}</label></p>
                        <p>Número: <label>${fornecedor.nrRua}</label></p>
                    </div>
                </div>
            </div>
        </div>


        <div id="boxs" class="row" >
            <div id="informacoes" class="col-xs-10 col-sm-8 col-md-8">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12">
                        <h4>Serviço </h4>
                        <p>Descrição: </p>
                        <p id="descricao">${servico.descricao}</p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>Serviço: <label>${servico.categoria}</label></p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>Preço: <label>${servico.preco}</label></p>
                    </div>
                    <div class="col-xs-12 col-sm-4 col-md-4">
                        <p>Preço entrega: <label>${servico.frete}</label></p>
                    </div>
                </div>
            </div>
        </div>
        <form action="../AgendaServicoServlet" method="post" id="formAgendamento">
            <div id="boxs" class="row" >
                <div id="agendamento" class="col-xs-12 col-sm-8 col-md-8">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12">
                            <h4>Agendamento: </h4>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="fonte">Meu Pet: *</label>
                            <select class="custom-select" name="idPet" id="inputGroupSelectPets">
                                <option selected="selected">--</option>
                                <c:forEach var="pet" items="${listPet}">
                                    <option value="${pet.idPet}">${pet.nome}</option>
                                </c:forEach>
                            </select>

                            <label class="fonte">Dias disponíveis: *</label>
                            <select class="custom-select" name="dataAgendamento" id="inputGroupSelectDias">
                                <option selected>--</option>
                                <c:forEach var="data" items="${listaData}">
                                    <option value="${data.dayOfMonth}/${data.monthValue}/${data.year}">${data.dayOfMonth}/${data.monthValue}/${data.year}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="fonte">Animal: *</label>
                            <input type="text" name="nome" value="" class="form-control" id="inputAnimalTipo" readonly>

                            <label class="fonte">Horários disponíveis: *</label>
                            <select class="custom-select" name="horaAgendamento" id="inputGroupSelectHoras">
                                <option selected>--</option>
                            </select>
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                            <label class="fonte">Porte: *</label>
                            <input type="text" name="nome" value="" class="form-control" id="inputPorte" readonly>
                        </div>
                    </div>
                </div>
            </div>
            <div id="boxs" class="row" >
                <div class="form-group col-xs-12 col-sm-10 col-md-10">
                    <button type="submit" name="opcao" id="salvar_agendamento" class=" btn2 btn btn-success float-right" value="salvar">Agendar</button>
                    <button type="button" name="opcao" id="cancelar_agendamento" class=" btn2 btn btn-cancel float-right " value="cancelar">Cancelar</button>
                </div> 
            </div>
            <input type="hidden" name="idFornecedor" value="${fornecedor.id}"/>
            <input type="hidden" name="idServico" id="idServico" value="${servico.id}"/>
            <input type="hidden" name="idCliente" value="${idCliente}"/>
        </form>

        <%@include file="rodape.jsp"%>
        <script type="text/javascript" src="../js/PaginadeServico.js" charset="utf-8"></script>
    </body>
</html>
