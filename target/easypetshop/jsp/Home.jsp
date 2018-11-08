<%-- 
    Document   : Home
    Created on : 01/09/2018, 05:35:48
    Author     : AsColaco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String status = request.getParameter("status");

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" type="text/css" href="../css/home.css">
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css">  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>
        <%
            String logado = novo.getNome();
        %>
        <div class="container" >

            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">
                    <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img class="d-block w-100 teste" src="../ResourcesIm/help1.jpg" alt="First slide">
                                <div class="carousel-caption ">
                                    <h1 id="letra" >Cuidados para seu Pet</h1>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 teste" src="../ResourcesIm/banner03.jpg" alt="Second slide">
                                <div class="carousel-caption ">
                                    <h1 id="letra" >Plataforma Completa para Logista </h1>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 teste" src="../ResourcesIm/help2.jpg" alt="Third slide">
                                <div class="carousel-caption ">
                                    <h1 id="letra" >Acessórios Para seu Pet</h1>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 teste" src="../ResourcesIm/banner04.jpg" alt="Four slide">
                                <div class="carousel-caption ">
                                    <h1 id="letra">Entrega Rapida e Pratica</h1>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img class="d-block w-100 teste" src="../ResourcesIm/banner05.jpg" alt="Third slide">
                                <div class="carousel-caption ">
                                    <h1 id="letra">Produtos Para seu Pet</h1>

                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>                 
                </div>
            </div>

            <h1 id="homeT"> Poucos cliques, muitos recursos!<br>
                <span> Aqui se encontram as principais funcionalidades que trarão conveniencia ao seu dia a dia</span></h1>
        </div>
        <div class="row"> 
            <div class="col-xs-12 col-sm-6 col-md-6" id="texto">

            </div>
            <div class="col-xs-12 col-sm-5 col-md-5" id="texto">

            </div>     
        </div>



        <div class="row"> 
            <div class="col-xs-12 col-sm-6 col-md-6" id="texto">
                <h2>Donos de PetShop</h2>
                <p>
                    Ce este Lorem Ipsum?
                    Lorem Ipsum este pur şi simplu o machetă pentru text a industriei tipografice. Lorem Ipsum a fost macheta standard a industriei încă din secolul al XVI-lea, când un tipograf anonim a luat o planşetă de litere şi le-a amestecat pentru a crea o carte demonstrativă pentru literele respective. Nu doar că a supravieţuit timp de cinci secole, dar şi a facut saltul în tipografia electronică practic neschimbată. A fost popularizată în anii '60 odată cu ieşirea colilor Letraset care conţineau pasaje Lorem Ipsum, iar mai recent, prin programele de publicare pentru calculator, ca Aldus PageMaker care includeau versiuni de Lorem Ipsum.
                </p>
            </div>
            <div class="col-xs-12 col-sm-5 col-md-5" id="texto">
                <h2>Nossos Serviços</h2>
                <p>
                    Ce este Lorem Ipsum?
                    Lorem Ipsum este pur şi simplu o machetă pentru text a industriei tipografice. Lorem Ipsum a fost macheta standard a industriei încă din secolul al XVI-lea, când un tipograf anonim a luat o planşetă de litere şi le-a amestecat pentru a crea o carte demonstrativă pentru literele respective. Nu doar că a supravieţuit timp de cinci secole, dar şi a facut saltul în tipografia electronică practic neschimbată. A fost popularizată în anii '60 odată cu ieşirea colilor Letraset care conţineau pasaje Lorem Ipsum, iar mai recent, prin programele de publicare pentru calculator, ca Aldus PageMaker care includeau versiuni de Lorem Ipsum.
                </p>
            </div>     
        </div>   

        <%@include file="rodape.jsp"%>
        <script type="text/javascript">
            <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("Okp")) { %>
                alert("Pet Cadastrado com Sucesso!");
            <%}%>
            }
            ;
            <%}%>
        </script>
    </body>
</html>
