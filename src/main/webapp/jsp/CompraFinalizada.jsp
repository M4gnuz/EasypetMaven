
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compra Finalizada</title>
        <link rel="stylesheet" type="text/css" href="../css/carrinho.css">  
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link href="../Plugins/css/main.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>

    </head>
    <body id="tudo" class="paginaCarrinho">

        <%@include file="cabecalhoSimples.jsp"%>
        <div class="row" >
            <div class="col-xs-12 col-sm-1 col-md-1"></div>
            <div id="compraFinalizada" class="col-xs-12 col-sm-10 col-md-10">
                
                  
                
                <div class="table-responsive cart_info">
                    <h2>Obrigada por comprar com a gente!</h2>
               
                      
                       
                    <h3>Volte sempre!</h3>
                      <div class="estrelas">
                            <label>
                                <img name="fb" value="1" class="apagada"/>
                            </label>
                            <label>
                                <img name="fb" value="2" class="apagada"/>
                            </label>
                            <label>
                                <img name="fb" value="3"  class="apagada"/>
                            </label>
                            <label>
                                <img name="fb" value="4"  class="apagada"/>
                            </label>
                            <label>
                                <img name="fb" value="5" class="apagada"/>
                            </label>
                        </div>  
                </div>
            </div>
            <br> <br>
        </div>
        <div class="row" >
            <div class="col-xs-12 col-sm-1 col-md-1"></div>
            <div id="compraFinalizada" class="col-xs-12 col-sm-10 col-md-10">
                <div class="table-responsive cart_info">
                    <button class="btn btn-sucess" data-toggle="collapse" data-target="#collapseOne" aria-expanded="False" aria-controls="collapseOne"
                            onclick="window.location.href = 'Home.jsp'">
                        <i class="fas fa-home"></i>  Voltar a Home
                    </button>
                </div>
            </div>

        </div>


        <br><br><br><br><br><br><br><br><br><br><br><br>

        <%@include file="rodapeSimples.jsp"%>
        <script type="text/javascript">
              function seleciona(name, indice) {
   var imgs = document.querySelectorAll('img[name=' + name + ']');
  
   for (var i=0; i < imgs.length; i++) {
       if (i <= indice)
           imgs[i].className = "destaque";
       else
           imgs[i].className = "apagada";
   }
}

window.onload = function() {
   var imgs = document.querySelectorAll('img[name=fb]');
  
   for (var i=0; i < imgs.length; i++) {
       (function(name, i) {
          imgs[i].addEventListener('click', function () {
              seleciona(name, i);
          });
       })(imgs[i].name, i);
   }
}
        </script>
    </body>
</html>