
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%String getUrl = request.getParameter("id");
    String status = request.getParameter("status");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finalizar Compra</title>
        <link rel="stylesheet" type="text/css" href="../css/carrinho.css">  
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link href="../Plugins/css/main.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
   
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>
        <script type="text/javascript" src="jquery-1.7.1.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
        crossorigin="anonymous"></script>  
        <script src="../Source Files/jquery-ui.min.js"></script> 

    </head>
    <body id="tudo" class="paginaCarrinho">

        <%@include file="CabecalhoCliente.jsp"%>
        <%-- <form action="../FinalizarCompraServlet.jsp" method="post" id="formulario">--%>

        <div class="row" >
            <div class="col-xs-12 col-sm-1 col-md-1"></div>
            <div id="opcoesPagamento" class="col-xs-12 col-sm-5 col-md-5">
                <div id="boxs" class="row" >
                    <div id="endereco" class="col-xs-10 col-sm-10 col-md-10">
                        <div class="row">
                            <div id="" class="col-xs-12 col-sm-12 col-md-12">
                                <h4>Confirme seu endereço</h4>
                            </div>
                            <div class="col-xs-12 col-sm-10 col-md-10">
                                <p>Cidade: <label>${cliente.cidade}</label></p> 
                                <p>Endereço: <label>${cliente.endereco}, ${cliente.bairro}</label></p>
                                <p>Número: <label>${cliente.nrRua}</label></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row"> 
                    <div id="Pagamentotitulo" class="col-xs-12 col-sm-12 col-md-12">
                        <label>Opções de Pagamento</label>
                    </div>    
                    <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">

                        <div class="custom-control custom-radio">
                            <input type="radio" id="rdbCredito" name="group1" class="custom-control-input" value="credito">                   
                            <label class="custom-control-label" for="rdbCredito"><i class="fas fa-credit-card"></i> Crédito</label>
                        </div>
                    </div>

                    <!--             <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">
                 
                                         <div class="custom-control custom-radio">
                                             <input type="radio" id="rdbDebito" name="group1" class="custom-control-input" value="debito">
                                             <label class="custom-control-label" for="rdbDebito"><i class="fas fa-credit-card"></i> Débito</label>
                                         </div>
                                     </div>-->
                    <div id="opcoesPagamento" class="col-xs-12 col-sm-4 col-md-4">
                        <div class="custom-control custom-radio">
                            <input type="radio" id="rdbBoleto" name="group1" class="custom-control-input" value="boleto">
                            <label class="custom-control-label" for="rdbBoleto"><i class="far fa-list-alt"></i> Boleto</label>
                        </div>
                    </div>
                </div>
            </div>
            <div id="conteudoCarrinho" class="col-xs-12 col-sm-6 col-md-6">
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Produto</td>
                                <td class="description">Descrição</td>
                                <td class="price">Preço</td>
                                <td class="quantity">Quantidade</td>
                                <td class="total">Total</td>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${pedido.itensPedido}" var="item">
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="${item.produto.imagem}" alt="" width="100" height="80"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h6>${item.produto.nome}</h6>
                                        <p>${item.produto.descricao}</p>
                                    </td>
                                    <td class="cart_price">
                                        <p>${item.produto.preco}</p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div style="text-align: center;" class="cart_quantity_button">               
                                            <p>${item.quantidade}</p>
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <p class="cart_total_price">${item.total}</p>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td colspan="2">&nbsp;</td>
                                <td colspan="4">
                                    <table id="resumoValor"  class="table table-condensed total-result">
                                        <tr style="border-bottom: 1px solid #C2C2C1;">
                                            <td colspan="2">Resumo</td>
                                        </tr>
                                        <tr>
                                            <td>Valor Frete</td>
                                            <td>20,00</td>
                                        </tr>
                                        <tr>
                                            <td>Valor Total de produtos</td>
                                            <td for="nome" class="label" text="${pedido.total}" id="pedido.Total">${pedido.total}</td>
                                        </tr>                                                                                
                                        <tr>
                                            <td>Valor Total da compra</td>
                                            <td id="pedido.TotalCompra"></td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>    
                </div>
            </div>

        </div>

        <div id="formaPagamentocredito" class="desc">
            <form method="post" action="../FinalizarCompraServlet" id="formulario">

                <input type="hidden" name="id_Cliente" value="<%=novo.getCartao().getId_cartao()%>">
                <input type="hidden" name="id_Pedido" value="<%=getUrl%>">

                <div class="row" >
                    <div class="col-xs-12 col-sm-1 col-md-1"></div>
                    <div id="opcoesPagamento" class="col-xs-12 col-sm-5 col-md-5">
                        <div class="form-row">
                            <div class="form-group col-xs-12 col-sm-5 col-md-5">
                                <label>Numero do cartão:</label>
                                <input type="text" name="nrCartao" class="form-control" id="inputNumeroCartao" value="<%=novo.getCartao().getNrCartao()%>">
                            </div>
                            <div class="form-group col-xs-12 col-sm-7 col-md-7 " id="sNome">
                                <label>Nome impresso no cartão:</label>
                                <input type="text" name="nomeImpresso" class="form-control" id="inputNome" value="<%=novo.getCartao().getNomeImpresso()%>">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-xs-12 col-sm-6 col-md-6">
                                <label>Validade:</label>
                                <input type="text" name="validade" class="form-control" id="inputValidade" value="<%=novo.getCartao().getValidade()%>">
                            </div>
                            <div class="form-group col-xs-12 col-sm-4 col-md-4 " id="sNome">
                                <label>Código de Segurança:</label>
                                <input type="text" name="cvv" class="form-control" id="inputCodSeguranca" maxlength="4">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-xs-12 col-sm-5 col-md-5">
                                <label>CPF do titular:</label>
                                <input type="text" name="cpf" class="form-control" id="inputCpf" value="<%=novo.getCartao().getCpfTitular()%>">
                            </div>
                            <div class="form-group col-xs-12 col-sm-6 col-md-6">
                                <!--<input type="text" name="parcelas" class="form-control" id="inputParcelas" maxlength="2">-->
                                <div>
                                    <label>Parcelas</label>
                                    <select class="form-control" name="parcelas" value id="inputParcelas">      
                                    </select>
                                    <br>
                                    <br>             
                                </div>
                            </div>
                            <div class="form-group col-xs-12 col-sm-7 col-md-7">
                                <label>Parcelas de 4x a partir de 100,00 reais e parcelas de 12x a partir de 300,00 reais!</label>
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group col-xs-12 col-sm-12 col-md-12">
                                <button type="button" name="opcao" id="EnviarCartaoCred" class=" btn2 btn btn-success float-right" value="salvar">Enviar</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div> 


        <div id="formaPagamentoboleto" class="desc">                               
            <div class="row" >
                <div class="col-xs-12 col-sm-1 col-md-1"></div>
                <div id="opcoesPagamento" class="col-xs-12 col-sm-6 col-md-6">
                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-10 col-md-10" id="nome">
                            <label><i class="fas fa-file-alt"></i> Imprima o boleto e <strong>pague no banco</strong></label>
                            <label><i class="fas fa-barcode"></i> <strong>ou pague pela internet</strong> utilizando o código de barras do boleto</label>
                            <label><i class="fas fa-calendar"></i> o prazo de validade do boleto é de <strong>2 dia útil</strong></label>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-xs-12 col-sm-10 col-md-10" id="nome">
                            <p>Importante:</p>
                            <ul>
                                <li>Caso o seu computador tenha um programa anti pop-up, será preciso desativá-lo antes de finalizar sua compra e imprimir o boleto ou pagar pelo internet banking;</li>
                                <li>Não faça depósito ou transferência entre contas. O boleto não é enviado pelos Correios. Imprima-o e pague-o no banco ou pela internet;</li>
                                <li>Se o boleto não for pago até a data de vencimento, o pedido será automaticamente cancelado;</li>
                                <li>O prazo de entrega dos pedidos pagos com boleto bancário começa a contar três dias depois do pagamento do boleto, tempo necessário para que a instituição bancária confirme o pagamento.</li>

                            </ul>
                        </div>
                    </div>
                </div>
            </div> 
        </div> 

        <div class="row">      
            <div class="form-group col-xs-10 col-sm-10 col-md-12">
                <button type="button" name="opcao" id="finalizar" class=" btn2 btn btn-success float-right" value="salvar">Finalizar</button>
                <button type="button" name="opcao" id="paginaProdutos" class=" btn2 btn btn-cancel float-right " value="voltar">Voltar a comprar</button>
            </div> 
        </div>
        <%--</form>--%>
        <br><br><br><br><br><br>
        <%@include file="rodapeSimples.jsp"%>
        <script type="text/javascript" src="../js/finalizarCarrinho.js" charset="utf-8">
            <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {
            <% if (status.equals("cvv")) {%>
                alert("Código de Segurança Incorreto!");
            <%}%>

            }
            ;
            <%}%>

        </script>
    </body>
</html>
