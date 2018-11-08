<%-- 
    Document   : MeusProdutos
    Created on : 01/09/2018, 00:41:36
    Author     : AsColaco
--%>

<% String status = request.getParameter("status"); %>
<%@page import="java.text.DecimalFormat"%>
<%@page import="classes.Fornecedor"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="java.util.List"%>
<%@page import="classes.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="dao.AlimentoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="servlet.Controle"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%!int contador = 0;%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detalhes do Agendamento</title>
	
	<link rel="stylesheet" type="text/css" href="../css/rodape.css">
	<link rel="stylesheet" type="text/css" href="../css/menuLateral.css">
	<link rel="stylesheet" type="text/css" href="../css/cabecalho.css">
	<link rel="stylesheet" type="text/css" href="../css/DetalhesAgendamento.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />
	
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<title>Detalhes do Agendamento</title>
</head>
<body id="tudo">
	<%@include file="cabecalhoSimples.jsp"%>
	<div class="container">
		<div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
			<!--   <h4><=nome></h4>-->
		</div>
	</div>
	<div class="container">
		<div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
			<h1 id="nomeTopo">Detalhes do Agendamento</h1>
		</div>
	</div>

	<%@include file="menuLateral.jsp"%>

	<div class="principal col-xs-12 col-sm-6 col-md-6" style="background-color: #85cc16cc;">
		<hr>
		<div class="row">
			<div class="col-md-5">
				<h5 class="">Detalhes Comprador</h5>
				<br> 
				<label>Nome: </label> <label value="nomeCliente">Joao Jose</label>
				<br> 
				<label>CPF: </label> <label value="cpfCliente">XXXXXXXXXXX</label><br>
				<label>E-mail: </label> <label value="emailCliente">EasyPeste@pesteEasy.com</label><br>
				<label>Telefone: </label> <label value="telefoneCliente">9 1111-1111</label><br>
			</div>

			<div class="col-md-5 box linha-vertical">
				<h5 class="">Endereço de Entrega</h5>
				<br> 
				<label>Endereço: </label> 
				<label value="enderecoCliente">Joao Jose</label><br> <label>CEP: </label> 
				<label value="cepCliente">XXXXXXXXXXX</label><br>
				<label>Número : </label><label value="cepCliente">XXXXXXXXXXX</label><br>
				<label>Complemento: </label><label value="cepCliente">XXXXXXXXXXX</label><br>
				<label>Bairro: </label><label value="cepCliente">XXXXXXXXXXX</label><br>
				<label>Cidade: </label><label value="cepCliente">XXXXXXXXXXX</label><br>
			</div>
		</div>
		<br>
		<hr>
		<div class="col-xs-12 col-sm-12 col-md-12 ">
			<table class="table" id="tabela_busca_meus_agendamentos_cliente">
				<thead class="thead-dark">
					<tr>
						<th scope="col">PetShop</th>
						<th scope="col"></th>
						<th scope="col">Pet</th>
						<th scope="col">Serviço</th>
						<th scope="col"></th>
						<th scope="col">Preço</th>
						<th scope="col">Data</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>Pet shop Yes</th>
						<th></th>
						<th>Scooby</th>
						<th>Banho e Tosa</th>
						<th></th>
						<th>300,00</th>
						<th>01/12/2018</th>
					</tr>
				</tbody>
			</table>
		</div>
		<br>
		<hr>
		<div>
			<table class="table" id="tabela_busca_meus_pedidos">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col">SubTotal</th>
						<th scope="col">R$ xx,xx</th>

					</tr>
				</thead>
				<thead>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col">Valor Frete</th>
					<th scope="col">R$ xx,xx</th>

				</thead>
				<thead>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"><b>Total</b></th>
					<th scope="col">R$ xx,xx</th>

				</thead>
			</table>
			<hr>
			<div class="form-row botao">
				<div class="form-group col-xs-12 col-sm-8 col-md-8" id="cancelarPedido">
					<button type="button" id="btnCancelarPedido" class="  btn btn-success ">Cancelar Pedido</button>
				</div>
				<div class="form-group col-xs-12 col-sm-1 col-md-1" id="pagamentoRecebido">
					<button type="button" id="btnPedidoRecebido" class="  btn btn-success ">Pagamento Recebido</button>
				</div>
			</div>
		</div>
	</div>
	<%@include file="rodape.jsp"%>
	<script type="text/javascript" charset="utf-8">
	</script>
</body>
</html>