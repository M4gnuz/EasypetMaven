
<%@page import="classes.Fornecedor"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.ServicoDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Servico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Loja</title>
        <link rel="stylesheet" type="text/css" href="../css/paginadeProdutos.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">

        <script></script>
    </head>

    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>
        <div class="container" id="paginaProdutos">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="../ResourcesIm/banner_servicos.jpg" alt="First slide">
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div id="divPesquisa" class="col-sm-6">
                    <h2>Todos os serviços aqui!</h2>
                </div>
            </div>
            <div class="row">
                <div id="divPesquisa" class="col-sm-6">
                    <div id="imaginary_container"> 
                        <div class="input-group stylish-input-group">
                            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Buscar</button>
                        </div>
                    </div>
                </div>
            </div>
            <br>
            <br>
            <div class="row">
                <div  class="col-xs-6 col-sm-2 col-md-2">
                    <div id="menulateralProdutos">
                        <h6>Categoria</h6>
                        <div>
                            <input type="checkbox" name="fb" value="caes"/>
                            <label for="scales">Cães</label>
                        </div>

                        <div>
                            <input type="checkbox" name="fb" value="gatos"/>
                            <label for="scales">Gatos</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="aves"/>
                            <label for="scales">Aves</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="peixes"/>            
                            <label for="scales">Peixes</label>
                        </div>
                        <br>
                        <h6>Serviços</h6>
                        <div>
                            <input type="checkbox" name="fb" value="Banho"/>
                            <label for="scales">Banho</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Tosa"/>
                            <label for="scales">Tosa</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Passeios"/>            
                            <label for="scales">Passeios</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Massagens"/>            
                            <label for="scales">Massagens</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Banho e Tosa"/>            
                            <label for="scales">Banho e Tosa</label>
                        </div>

                        <div id="divPreco"><label for="customRange1" id="customRange1Preco" value='50' max='100'>Preço</label>
                            <input type="range" class="custom-range" id="customRange1">
                        </div>

                        <div class="w-100"></div>
                    </div>
                </div>


                <div class="col-xs-10 col-sm-10 col-md-10">
                    <div class="row">
                        <%
                            List<Servico> lista = new ArrayList();
                            ServicoDAO.getAllServicos(lista);
                            DecimalFormat df = new DecimalFormat("#.00");
                            for (int contador = 0; contador < lista.size(); contador++) {
                                out.print("<div class='col-sm-4'>");
                                out.print("<div class='product-image-wrapper'>");
                                out.print("<div class='single-products'>");
                                out.print("<div class='productinfo text-center'>");
                                Servico serv = lista.get(contador);
                                out.print("<h3>R$ " + df.format(serv.getFrete() + serv.getPreco()) + "</h3>");
                                out.print("<p>" + serv.getCategoria() + "</p>");
                                Fornecedor fornecedor = FornecedorDAO.getFornecedor(serv.getIdFornecedor());
                                out.print("<p class='p2'>" + fornecedor.getNome() + "</p>");
                                out.print("<a href='../Controle?id=" + serv.getId() + "&action=agendarServ' class='btn btn-default add-to-cart'><i 'id='comprar" + contador
                                        + "' class='fas fa-clipboard-list' ></i> Agendar</a>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                                out.print("</div>");
                            }
                        %>
                    </div>
                </div>


            </div>
        </div>
        <br><br><br><br><br><%@include file="rodape.jsp"%>
    </body>
</html>

