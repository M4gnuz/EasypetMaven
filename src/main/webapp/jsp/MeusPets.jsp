
<%@page import="dao.PetDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="classes.Pet"%>
<%@page import="classes.Pet"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<%! int contador = 0;%>
<%String status = request.getParameter("status"); %>
<!DOCTYPE html>
<html>
    <head>       

        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Meus Pets</title>

        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" type="text/css" href="../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../css/cabecalhoCliente.css">  
        <link rel="stylesheet" type="text/css" href="../css/meusProdutos.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css" />

        <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
        <title>Meus Pets</title>


    </head>
    <body id="tudo">
        <%@include file="CabecalhoCliente.jsp"%>

        <div class="container">
            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
                <h4><% out.print(novo.getNome());%></h4>
            </div>
        </div>

        <div class="container">
            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo">Meus Pets</h1>
            </div>
        </div>

        <%@include file="menuLateralCliente.jsp"%>

        <div class="principal col-xs-12 col-sm-6 col-md-6">
            <hr>
            <div>
                <div class="col-md-8">
                </div>
            </div>
            <br>
            <table class="table meuspets" id="tabela_busca_meus_produtos">
                <thead class="thead-dark">
                    <tr>
                        <th style='text-align: center' scope="col">Imagem</th>
                        <th style='text-align: center' scope="col">ID</th>
                        <th style='text-align: center' scope="col">Nome</th>
                        <th style='text-align: center' scope="col">Porte</th>                      
                        <th style='text-align: center' scope="col">Excluir</th>
                        <th style='text-align: center' scope="col">Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Pet> lista = new ArrayList();                       
                        PetDAO.getPets(lista, id);

                        for (int contador = 0; contador < lista.size(); contador++) {
                            Pet pet = lista.get(contador);
                            out.print("<tr>"
                                    + "<td scope='row'><img src='" + pet.getImagem() + "' width='100px' height='80px' ></td>"
                                    + "<td style='text-align: center'>" + pet.getIdPet()+ "</td>"
                                    + "<td style='text-align: center'>" + pet.getNome() + "</td>"                                   
                                    + "<td style='text-align: center'>" + pet.getPorte()+ "</td>"                                   
                                    + "<td style='text-align: center'><a href='../Controle?id=" + pet.getIdPet()+ "&action=delPet 'id='excluirProd" + contador
                                    + "' name='botoes' class='fas fa-trash-alt' style='font-size:22px;'</a></td>"
                                    + "<td style='text-align: center'><a href='../Controle?id=" + pet.getIdPet()+ "&action=altPet' <i 'id='editarProd" + contador
                                    + "' class='far fa-edit' style='font-size:22px;'></i></a></td>"
                                    + "</tr>");
                        }
                    %>
                </tbody>                
            </table>

            <br>

        </div> 
        <%@include file="rodape.jsp"%>      

        <script type="text/javascript" charset="utf-8">
             <% if (status != null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (status.equals("OK")) { %>
                alert("Pet Cadastrado com Sucesso!");
            <%}%>            
            <% if (status.equals("OKdelPet")) { %>
                alert("Pet Excluído com Sucesso!");
            <%}%>            
            }
            ;
            <%}%>

        </script>
    </body>
</html>
