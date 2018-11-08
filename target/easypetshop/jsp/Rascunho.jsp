<%-- 
    Document   : MeusProdutos
    Created on : 01/09/2018, 00:41:36
    Author     : AsColaco
--%>

<%
	String status = request.getParameter("status");
%>
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
<title>Detalhes do Agendamento</title>


</head>
<body id="tudo">
	<%@include file="cabecalhoSimples.jsp"%>
	<div class="container">
		<h1 id="nomeTopo">Meus Produtos</h1>
		<div></div>
	</div>
	<%@include file="rodape.jsp"%>
</body>
</html>