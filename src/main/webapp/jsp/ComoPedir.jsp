<%-- 
    Document   : ComoPedir
    Created on : 07/09/2018, 14:04:59
    Author     : AsColaco
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Como Pedir</title>
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
        <div class="container">
            <h1 class="titulo">Como Pedir</h1>
            <div id="texto">
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus ipsum, mattis fringilla fringilla ac, sollicitudin eu arcu. In vel sapien a diam porta suscipit quis a mi. Donec bibendum massa eros, eget ultricies ligula laoreet vitae. Fusce elementum ex enim, nec posuere libero finibus et. Maecenas id interdum leo. Mauris suscipit mi nec mattis euismod. Maecenas ac leo a sapien feugiat dapibus. Donec convallis bibendum ligula, nec iaculis eros imperdiet ac. Ut volutpat dui a urna tincidunt, porta tempor ligula hendrerit. Integer elementum risus sed lorem iaculis, id ornare ipsum rhoncus. Nulla suscipit hendrerit risus ac finibus. Ut quis dignissim nisl, a gravida lacus. Morbi sit amet nunc ac justo congue rutrum vitae ac dui. Maecenas ac dolor a dui maximus dapibus vitae ac lacus. Phasellus at lectus lectus. Sed orci justo, ullamcorper id odio non, cursus dictum dolor.

                    id hendrerit dictum. Donec tristique lacinia tristique. Vivamus pretium dolor vel tortor auctor lacinia. Aliquam interdum tortor egestas dolor egestas faucibus. Fusce id porttitor elit. Nulla sed pretium dolor. Duis maximus sed metus quis gravida. Nullam id ipsum sodales nulla ultrices eleifend. Donec pretium in ligula non suscipit. Quisque luctus ex vel efficitur finibus.    
                </p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacus ipsum, mattis fringilla fringilla ac, sollicitudin eu arcu. In vel sapien a diam porta suscipit quis a mi. Donec bibendum massa eros, eget ultricies ligula laoreet vitae. Fusce elementum ex enim, nec posuere libero finibus et. Maecenas id interdum leo. Mauris suscipit mi nec mattis euismod. Maecenas ac leo a sapien feugiat dapibus. Donec convallis bibendum ligula, nec iaculis eros imperdiet ac. Ut volutpat dui a urna tincidunt, porta tempor ligula hendrerit. Integer elementum risus sed lorem iaculis, id ornare ipsum rhoncus. Nulla suscipit hendrerit risus ac finibus. Ut quis dignissim nisl, a gravida lacus. Morbi sit amet nunc ac justo congue rutrum vitae ac dui. Maecenas ac dolor a dui maximus dapibus vitae ac lacus. Phasellus at lectus lectus. Sed orci justo, ullamcorper id odio non, cursus dictum dolor.

                    Etiam scelerisque it dictum. Donec tristique lacinia tristique. Vivamus pretium dolor vel tortor auctor lacinia. Aliquam interdum tortor egestas dolor egestas faucibus. Fusce id porttitor elit. Nulla sed pretium dolor. Duis maximus sed metus quis gravida. Nullam id ipsum sodales nulla ultrices eleifend. Donec pretium in ligula non suscipit. Quisque luctus ex vel efficitur finibus.
                </p>
               
            </div>

        </div>
        <%@include file="rodape.jsp"%>
    </body>
</html>
