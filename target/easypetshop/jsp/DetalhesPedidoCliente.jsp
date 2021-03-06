<%-- 
    Document   : MeusProdutos
    Created on : 01/09/2018, 00:41:36
    Author     : AsColaco
--%>
<% String status = request.getParameter("status"); %>
<%!int contador = 0;%>
<%@page import="classes.ItemPedido"%>
<%@page import="classes.Pedido"%>
<%@page import="dao.PedidoDAO"%>
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

<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Detalhes do Pedido</title>
	
	<link rel="stylesheet" type="text/css" href="../css/rodape.css">
	<link rel="stylesheet" type="text/css" href="../css/menuLateral.css">
	<%
		int n = 0;
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("nivel")) {
				n = Integer.parseInt(cookie.getValue());
	
			}
		}
		if (n == 1) {
			out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalhoCliente.css'>");
		} else {
			out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalho.css'>");
		}
	%>
        <link rel="stylesheet" type="text/css" href="../css/DetalhesPedidoCliente.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />
	<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
	<title>Detalhes do Pedido</title>
</head>
<body id="tudo">
	<% if (n == 1) { %>
	<%@include file="CabecalhoCliente.jsp"%>
	<% } else { %>
	<%@include file="cabecalho.jsp"%>
	<% } %>
	<%
		int idPedido = 0;
		List<Pedido> lista = new ArrayList();
		List<ItemPedido> itens = new ArrayList();
		for (Cookie cookie : request.getCookies()) {
			if (cookie.getName().equals("idPedido")) {
				idPedido = Integer.parseInt(cookie.getValue());
			}
		}
		PedidoDAO p = new PedidoDAO();
		Pedido pedido = new Pedido();
		DecimalFormat df = new DecimalFormat("#.00");
		Cliente cliente = new Cliente();
		//lista com os pedidos
		p.getDetalhes(lista, idPedido, cliente);
		Pedido p2 = lista.get(0);
		itens = p2.getItensPedido();
	%>
	<div class="container">
		<div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
			<!--   <h4><=nome></h4>-->

		</div>
	</div>
	<div class="container">
		<div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
			<h1 id="nomeTopo">Detalhes do Pedido</h1>
		</div>
	</div>
	<% if (n == 1) { %>
	<%@include file="menuLateralCliente.jsp"%>
	<% } else { %>
	<%@include file="menuLateral.jsp"%>
	<% } %>

	<div class="principal col-xs-12 col-sm-6 col-md-6"
		style="background-color: #85cc16cc;">
		<hr>
		<div class="row">

			<div class="col-md-5">
				<h5 class="">Detalhes Comprador</h5>
				<br> <label>Nome: </label> <label value="nomeCliente"><%=cliente.getNome()%></label><br>
				<label>CPF: </label> <label value="cpfCliente"><%=cliente.getCpf()%></label><br>
				<label>E-mail: </label> <label value="emailCliente"><%=cliente.getEmail()%></label><br>
				<label>Telefone: </label> <label value="telefoneCliente"><%=cliente.getTelefone()%></label><br>

			</div>


			<div class="col-md-5 box linha-vertical">
				<h5 class="">Endere�o de Entrega</h5>
				<br> <label>Endere�o: </label> <label value="enderecoCliente"><%=cliente.getEndereco()%></label><br>
				<label>CEP: </label> <label value="cepCliente"><%=cliente.getCep()%></label><br>
				<label>N�mero : </label><label value="cepCliente"><%=cliente.getNrRua()%></label><br>
				<label>Complemento: </label><label value="cepCliente"><%=cliente.getComplemento()%></label><br>
				<label>Bairro: </label><label value="cepCliente"><%=cliente.getBairro()%></label><br>
				<label>Cidade: </label><label value="cepCliente"><%=cliente.getCidade()%></label><br>

			</div>
		</div>
		<br>
		<hr>
		<table class="table" i>
			<thead class="thead-dark">
				<tr>
					<th scope="col">Produto</th>
					<th scope="col">Quantidade</th>
					<th scope="col">Pre�o</th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col">Total</th>
				</tr>
			</thead>
			<tbody>
				<%
					float total = 0;
					for (int x = 0; x < itens.size(); x++) {
						ItemPedido item = itens.get(x);
						out.print("<tr>" 
							+ "<th>" + item.getProduto().getNome() + "</th>" 
							+ "<th>" + item.getQuantidade() + "</th>" 
							+ "<th>" + df.format(item.getProduto().getPreco()) + "</th>" 
							+ "<th></th>"
							+ "<th></th>" 
							+ "<th>" + df.format(item.getTotal()) + "</th>" 
							+ "</tr>");
						total += item.getTotal();
					}
				%>
			</tbody>
		</table>
		<br>
		<hr>
                <form action="../AvaliacaoServlet" method="post" id="formAvaliacao">
                <div class=" form-group ">
                                <label>Avalia��o</label>
                                <select class="custom-select" name="avaliacao" id="inputGroupSelect02" <% if(p2.getAvaliacao() == 1 || p2.getAvaliacao() == 2 || p2.getAvaliacao() == 3 || p2.getAvaliacao() == 4 || p2.getAvaliacao() == 5) out.print("disabled"); %>>
                                    <option value="1"<% if(p2.getAvaliacao() == 1)out.print("selected");%>>1</option>
                                    <option value="2"<% if(p2.getAvaliacao() == 2)out.print("selected");%>>2</option>
                                    <option value="3"<% if(p2.getAvaliacao() == 3)out.print("selected");%>>3</option>
                                    <option value="4"<% if(p2.getAvaliacao() == 4)out.print("selected");%>>4</option>
                                    <option value="5"<% if(p2.getAvaliacao() == 5)out.print("selected");%>>5</option>                                     
                                </select>
                                    <button type="submit" value="Salvar" id="salvar" <% if(p2.getAvaliacao() == 1 || p2.getAvaliacao() == 2 || p2.getAvaliacao() == 3 || p2.getAvaliacao() == 4 || p2.getAvaliacao() == 5) out.print("disabled hidden"); %>>Salvar</button>
                            </div>
                    </form>
		<div>
			<table class="table" id="tabela_busca_meus_pedidos">
				<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col"></th>
						<th scope="col">SubTotal</th>
						<th scope="col">R$ <%=total%></th>
					</tr>
				</thead>
				<thead>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col">Valor Frete</th>
					<th scope="col">R$ xx,xx</th>
					<% %>
				</thead>
				<thead>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"><b>Total</b></th>
					<th scope="col">R$<%=total%></th>
				</thead>
			</table>
			<hr>
			<div class="form-row botao"></div>
		</div>
	</div>
	<%@include file="rodape.jsp"%>
	<script type="text/javascript" charset="utf-8">
	</script>
</body>
</html>