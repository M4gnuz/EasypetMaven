<%-- 
    Document   : TermosECondicoes
    Created on : 02/09/2018, 22:45:52
    Author     : AsColaco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quem Somos</title>
        <link rel="stylesheet" type="text/css" href="../css/termosECondicoes.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <% 
        int n = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("nivel")) {
                    n = Integer.parseInt(cookie.getValue());

                }                
            }      
            if(n == 1){
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalhoCliente.css'>");
            }
            else{
                out.print("<link rel='stylesheet' type='text/css' href='../css/cabecalho.css'>");
            }
        %>  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="CabecalhoAlternado.jsp"%>
        <div class="container" id="quemSomos">
            <h1 class="titulo">Quem Somos</h1>
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div id="texto">
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing id hendrerit dictum. Donec tristique lacinia tristique. Vivamus pretium dolor vel tortor auctor lacinia. Aliquam interdum tortor egestas dolor egestas faucibus. Fusce id porttitor elit. Nulla sed pretium dolor. Duis maximus sed metus quis gravida. Nullam id ipsum sodales nulla ultrices eleifend. Donec pretium in ligula non suscipit. Quisque luctus ex vel efficitur finibus.    
                        </p>
                        <p>
                            Lorem ipsumEtiam scelerisque it dictum. Donec tristique lacinia tristique. Vivamus pretium dolor vel tortor auctor lacinia. Aliquam interdum tortor egestas dolor egestas faucibus. Fusce id porttitor elit. Nulla sed pretium dolor. Duis maximus sed metus quis gravida. Nullam id ipsum sodales nulla ultrices eleifend. Donec pretium in ligula non suscipit. Quisque luctus ex vel efficitur finibus.
                        </p>
                        <p>
                            Lorem ipsumEtiam scelerisque it dictum. Donec tristique lacinia tristique. Vivamus pretium dolor vel tortor auctor lacinia. Aliquam interdum tortor egestas dolor egestas faucibus. Fusce id porttitor elit. Nulla sed pretium dolor. Duis maximus sed metus quis gravida. Nullam id ipsum sodales nulla ultrices eleifend. Donec pretium in ligula non suscipit. Quisque luctus ex vel efficitur finibus.
                        </p>
                      
                    </div>

                </div>

                <div class="col-md-6 col-sm-12">
                    <div class="text-center">
                        <img src="../ResourcesIm/banner.jpg" class="img-fluid" alt="Imagem responsiva">
                    </div>

                </div>

            </div>




        </div>
        <%@include file="rodape.jsp"%>
    </body>
</html>
