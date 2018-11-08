
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="classes.Servico"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page import="servlet.Controle"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>

<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Meus Produtos</title>

<link rel="stylesheet" type="text/css" href="../css/rodape.css">
<link rel="stylesheet" type="text/css" href="../css/menuLateral.css">
<link rel="stylesheet" type="text/css" href="../css/cabecalho.css">
<link rel="stylesheet" type="text/css" href="../css/meusProdutos.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
<title>Meus Serviços</title>


</head>
<body id="tudo">
	<%@include file="cabecalho.jsp"%>
	<div class="container">
		<div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
			<h4>Nome Fornecedor</h4>

		</div>
	</div>

	<div class="container">
		<div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
			<h1 id="nomeTopo">Meus Serviços</h1>
		</div>
	</div>

	<%@include file="menuLateral.jsp"%>

	<div class="principal col-xs-12 col-sm-6 col-md-6">
		<hr>
		<div>
			<div class="col-md-8"></div>
			<div class="col-md-4"></div>

		</div>
		<br>
		<table class="table" id="tabela_busca_meus_servicos"
			style="text-align: center">
			<thead class="thead-dark">
				<tr>
					<th style='text-align: center' scope="col">Serviço</th>
					<th style='text-align: center' scope="col">Tempo</th>
					<th style='text-align: center' scope="col">Preço</th>
					<th style='text-align: center' scope="col">Excluir</th>
					<th style='text-align: center' scope="col">Editar</th>
				</tr>
			</thead>
			<tbody>
				<%
					List<Servico> lista = new ArrayList();
					DecimalFormat df = new DecimalFormat("#.00");
					ServicoDAO.getProdutos(lista, id);
					for (int contador = 0; contador < lista.size(); contador++) {
						Servico servico = lista.get(contador);
						out.print("<tr>" + "<td>" + servico.getCategoria() + "</td>" + "<td>" + servico.getTempo() + "</td>"
								+ "<td>" + df.format(servico.getPreco() + servico.getFrete()) + "</td>"
								+ "<td><a href='../Controle?id=" + servico.getId() + "&action=delServico'id='excluirProd"
								+ contador + "' name='botoes' class='fas fa-trash-alt' style='font-size:22px;'</a></td>"
								+ "<td><a href='../Controle?id=" + servico.getId() + "&action=altServico' <i 'id='editarProd"
								+ contador + "' class='far fa-edit' style='font-size:22px;'></i></a></td>" + "</tr>");
					}
				%>
			</tbody>
		</table>
		<br>
	</div>
	<%@include file="rodape.jsp"%>
	<script type="text/javascript" charset="utf-8">
		$("#tabela_busca_meus_servicos").dataTable({
			"language" : {
				"url" : "//cdn.datatables.net/plug-ins/1.10.19/i18n/Portuguese-Brasil.json"
			}
		});
	</script>
</body>
</html>