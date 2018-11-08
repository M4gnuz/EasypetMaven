
<%
    int id = Integer.parseInt(request.getParameter("id"));
    String status = request.getParameter("status");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Fornecedor - imagem</title>
        <link rel="stylesheet" type="text/css" href="../css/CadastroDeProdutosImagem.css">    
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
    </head>
    <body id="tudo">
        <%@include file="cabecalhoSimples.jsp"%>
        <div class="container" id="quemSomos">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <h4 class="titulo">Escolha uma foto de sua loja!</h4>
                    <div class="col-md-6 col-sm-6" id="centro">
                        <div class="custom-file" id="anexo">
                            <input type="file" name="imagem" class="custom-file-input mb-3" id="customFile" onchange="uploadFile()">
                            <label class="custom-file-label" for="customFile">Enviar Fotos</label>
                            <img alt="Imagem" src="" id="target" width="150" height="150">
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <button type="button" id="excluir_foto" class=" btn2 btn btn-success float-right">Excluir</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <button type="button" id="enviarImagem" class=" btn2 btn btn-success float-right">Enviar</button>    
                            </div>
                        </div>

                    </div>                   
                </div>
            </div>
        </div>
        <%@include file="rodape.jsp"%>
        <script type="text/javascript">
            function uploadFile() {
                var target = document.querySelector("#target");
                var file = document.querySelector("input[type=file]").files[0];

                var reader = new FileReader();
                reader.onloadend = function () {
                    target.src = reader.result;
                    var base64result = reader.result.substr(reader.result.indexOf(',') + 1);

                    $.ajax({
                        method: "POST",
                        url: "../uploadFornecedor?id=<%=id%>",
                        data: {
                            upload: base64result
                        }
                    }).done(function (response) {

                    }).fail(function (xhr, status, errorThrow) {
                        alert("Error: " + xhr.responseText);
                    });
                };

                if (file) {

                    reader.readAsDataURL(file);
                } else {
                    target.src = "";
                }
            }
            <% if (status != null) {%>
            <% if (status.equals("OK")) { %>
            alert("Dados Cadastrados com Sucesso!\nFavor inserir imagem para completar o cadastro.");
            <%}%>
            <% if (status.equals("OKedit")) { %>
            alert("Selecione a imagem para alterar no perfil.");
            <%}%>
            <%}%>
            document.getElementById("enviarImagem").onclick = function () {
                if (document.getElementById("target").src == window.location.href) {
                    alert("Selecione uma imagem!!");
                } else {
            <%if (status.equals("OKedit")) {%>                   
                    window.location.href = "MeusProdutos.jsp?status=OKeditForn";
            <% } else {%>                  
                     window.location.href = "../index.jsp?status=OK";
                <%}%>
            }};

        </script>
    </body>
</html>
