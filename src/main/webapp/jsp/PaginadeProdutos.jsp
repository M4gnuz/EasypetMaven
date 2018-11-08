<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="java.util.List"%>
<%@page import="classes.Produto"%>
<%@page import="java.util.ArrayList"%>
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

        <script> var $range = document.querySelector('input'),
                    $value = document.querySelector('span');
            $range.addEventListener('input', function() {
            $value.textContent = this.value;
            })" </script>
    </head>

    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>
        <div class="container" id="paginaProdutos">
            <div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="../ResourcesIm/banner_produtos_pets.jpg" alt="First slide">
                    </div>
                </div>
            </div>
            <br>
            <div class="row">
                <div id="divPesquisa" class="col-sm-6">
                    <h2>Todos os produtos aqui!</h2>
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
                <div  class="col-xs-3 col-sm-2 col-md-2">
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
                        <h6>Porte</h6>
                        <div>
                            <input type="checkbox" name="fb" value="pequeno"/>
                            <label for="scales">Pequeno</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="medio"/>
                            <label for="scales">Médio</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="grande"/>            
                            <label for="scales">Grande</label>
                        </div>
                        <br>
                        <h6>Produtos</h6>
                        <div>
                            <input type="checkbox" name="fb" value="Higiene"/>
                            <label for="scales">Higiene</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Brinquedos"/>
                            <label for="scales">Brinquedos</label>
                        </div>
                        <div>
                            <input type="checkbox" name="fb" value="Acessórios"/>                       
                            <label for="scales">Acessórios</label>
                        </div>

                        <div id="divPreco"><label for="customRange1" id="customRange1Preco" value='50' max='100'>Preço</label>
                            <input type="range" class="custom-range" id="customRange1">
                        </div>

                        <div class="w-100"></div>
                    </div>

                </div>
                <div id="vitrines" class="col-xs-10 col-sm-10 col-md-10">
                    <div class="row">
                        <%
                            List<Produto> lista = new ArrayList();
                            ProdutoDAO.getAllProdutos(lista);
                            DecimalFormat df = new DecimalFormat("#.00");
                            for (int contador = 0; contador < lista.size(); contador++) {
                                out.print("<div class='col-sm-12 col-md-3'>");
                                out.print("<div class='product-image-wrapper'>");
                                out.print("<div class='single-products'>");
                                out.print("<div class='productinfo text-center'>");
                                Produto produto = lista.get(contador);
                                out.print("<img src='" + produto.getImagem() + "' width='200px' height='200px' >");
                                out.print("<hr>");
                                produto = lista.get(contador);
                                out.print("<h3>R$" + df.format(produto.getPreco()) + "</h3>");

                                produto = lista.get(contador);
                                out.print("<p>" + produto.getNome() + "</p>");

                                produto = lista.get(contador);
                                out.print("<a href='../Controle?id=" + produto.getId() + "&action=comprar' <i 'id='comprar" + contador
                                        + "' class='fas fa-shopping-cart' style='font-size:22px; color:#39b54a;'></i></a>");
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
