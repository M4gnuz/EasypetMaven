
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.FornecedorDAO"%>
<%@page import="classes.Fornecedor"%>
<%@page import="classes.Alimento"%>
<%@page import="classes.Produto"%>
<%@page import="dao.AlimentoDAO"%>
<%@page import="javax.servlet.http.Cookie"%>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%String question = request.getParameter("question"); 
    String idEdit = request.getParameter("idEdit");
%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Produto Alimenticio</title>
        <link rel="stylesheet" type="text/css" href="../css/EditarAlimento.css">  
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link rel="stylesheet" type="text/css" href="../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Source Files/maskMoney.jquery.json"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>
    </head>
    <body id="tudo">
       
        <%@include file="cabecalho.jsp"%>
        <%           
            
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idProduto")) {
                    id = Integer.parseInt(cookie.getValue());
                }
            }
            Alimento alimento = AlimentoDAO.getAlimentosUnitario(id);
            DecimalFormat df = new DecimalFormat("#.00");
        %>

        <div class="container">

            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
                <h4><%out.print(forn.getNome());%></h4>
            </div>

        </div>
        <div class="container">

            <div id="logocentral" class="principal2 col-xs-12 col-sm-8 col-md-8">
                <h1 id="nomeTopo"> Produto Alimenticio</h1>
            </div>

        </div>

        <%@include file="menuLateral.jsp"%>

        <form action="../EditarAlimentoServlet" method="post" id="formAlimento">
            <div id="fotoprod" class="principal col-xs-12 col-sm-6 col-md-6">
           <!--     <h4>Fotos do seu produto</h4>

                <div class="custom-file" id="anexo">
                    <input type="file" class="custom-file-input mb-3" id="customFile">
                    <label class="custom-file-label" for="customFile">Enviar Fotos</label>
                </div> 
                <br><br>
                 <button type="button" id="excluir_fotoalimento" class=" btn2 btn btn-success">Excluir</button>
           -->
                <hr>
                <div class="form-group col-xs-12 col-sm-8 col-md-8" id="titulop">
                    <label>Titulo do Produto: *</label>
                    <input type="text" name="titulo" <% out.print("value='"+alimento.getNome()+"'"); %> class="form-control" id="inputTitulo">
                </div>


                <div class="form-group col-xs-12 col-sm-10 col-md-10" id="descri">
                    <label for="exampleFormControlTextarea1">Descrição:*</label>
                    <textarea class="form-control" name="descricao" id="txtdescricao" rows="4"><% out.print(alimento.getDescricao()); %></textarea>
                </div>
                <div class="form-group col-xs-12 col-sm-10 col-md-10" id="contraindicacao">
                    <label for="exampleFormControlTextarea1">Contra-Indicação:*</label>
                    <textarea class="form-control" name="contra" id="txtcontrain" rows="3"><% out.print(alimento.getContraIndicacao()); %></textarea>
                    <br>
                    <!-- PESQUISAR JQUERY CLONE PARA ESSA FUNÇÃO// OU ARRAY METODO POST -->
                        <label for="exampleFormControlTextarea1">Ingredientes:*</label>
                        <textarea class="form-control" name="ingredientes" id="txtIngredientes" rows="3"><% out.print(alimento.getNomeIngrediente()); %></textarea>
                    <hr>
                    <div class="row">
                        <div class="form-group col-xs-12 col-sm-4    col-md-4" id="precoA">
                            <div class="form-group " id="preco">
                                <label class="fonte">Preço: *</label>
                                <input type="text" <% out.print("value='"+df.format(alimento.getPreco())+"'"); %> name="precoA" class="form-control" id="inputPrecoA">

                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-3 col-md-3" id="estoqueA">
                            <div class=" form-group " id="estoque">
                                <label class="fonte">Estoque:*</label>
                                <input type="text" <% out.print("value='"+alimento.getEstoque()+"'"); %> maxlength="5" name="estoque" class="form-control" id="inputEstoqueA">
                            </div>
                        </div>
                        <div class="form-group col-xs-12 col-sm-5 col-md-5" id="dataV">
                            <div class="form-group " id="data">
                                <label class="fonte"> Data Vencimento:*</label>
                                <%
                            String data = alimento.getDtVencimento();
                            String datanova = "";
                            for(int x = 0; x<data.length();x++){
                               datanova+=data.charAt(x);
                            }
                            String dia=datanova.charAt(8)+""+datanova.charAt(9);
                            String mes =datanova.charAt(5)+""+datanova.charAt(6);
                            String ano =datanova.charAt(0)+"" + datanova.charAt(1)+"" + datanova.charAt(2)+"" + datanova.charAt(3);
                            String dataCerta = dia + mes + ano;                        	
                        	%>
                                <input type="date" <% out.print("value='"+dataCerta+"'"); %> name="dataV" class="form-control" id="inputDataV">
                            </div>
                        </div>

                        <div class=" form-group col-xs-12 col-sm-6 col-md-6">
                            <div class=" form-group ">
                                <label class="fonte">Categorias: *</label>
                                 <select class="custom-select" name="categoria" id="inputGroupSelect02">
                                    <option value="cachorros" <% if(alimento.getCategoria().equals("cachorros")) out.print("selected"); %>>Cachorros</option>
                                    <option value="gatos" <% if(alimento.getCategoria().equals("gatos")) out.print("selected"); %>>Gatos</option>
                                    <option value="passaros" <% if(alimento.getCategoria().equals("pássaros")) out.print("selected"); %>>Pássaros</option>
                                    <option value="hamsters" <% if(alimento.getCategoria().equals("hamsters")) out.print("selected"); %>>Hamsters</option>
                                    <option value="peixes" <% if(alimento.getCategoria().equals("peixes")) out.print("selected"); %>>Peixes</option>   
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="submit" id="salvar_alimento" class=" btn2 btn btn-success float-right">Salvar</button>
            <button type="button" id="cancelar_alimento" class=" btn2 btn btn-cancel float-right">Cancelar</button>
            </div>
        </form>   
        <%@include file="rodape.jsp"%>	
        <script type="text/javascript" src="../js/cadastroAlimento.js" charset="utf-8"></script> 
                <script type="text/javascript" charset="utf-8">
            document.getElementById("cancelar_alimento").onclick= function(){
                history.back();               
            };
             <% if (question != null&& idEdit!= null) {%>
            if (window.addEventListener) {
                window.addEventListener('load', validaAlert());
            } else {
                window.attachEvent('onload', validaAlert());
            }
            function validaAlert() {

            <% if (question.equals("imagem")) { %>
              var editaImagem = confirm("Gostaria de editar a imagem do produto?");
                if(editaImagem){
                    window.location.href="cadastroDeProdutosImagem.jsp?status=OKedit&id=<%=idEdit%>";
                }else{
                     window.location.href="MeusProdutos.jsp?status=OKedit";
                }
            <%}%>           
            }
            ;
            <%}%>
        </script> 
    </body>
</html>
