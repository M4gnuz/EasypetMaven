
<%@page import="dao.PetDAO"%>
<%@page import="classes.Pet"%>
<!DOCTYPE html>
<% 
int idPet = 0;
            for (Cookie cookie : request.getCookies()) {
                if (cookie.getName().equals("idPet")) {
                    idPet = Integer.parseInt(cookie.getValue());
                }                
            }
            Pet pet = new Pet();
PetDAO.getPet(pet, idPet);

String question = request.getParameter("question"); 
    String idEdit = request.getParameter("idEdit");

%>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Pet</title>
        <link rel="stylesheet" type="text/css" href="../css/cadastroAlimento.css">
        <link rel="stylesheet" href="../Source Files/jquery-ui.min.css">
        <link rel="stylesheet" type="text/css" href="../css/cabecalho.css"> 
        <link rel="stylesheet" type="text/css" href="../css/menuLateral.css"> 
        <link rel="stylesheet" type="text/css" href="../css/rodape.css"> 
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" crossorigin="anonymous">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
              crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="../Source Files/maskMoney.jquery.json"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery.maskedinput/1.4.1/jquery.maskedinput.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-maskmoney/3.0.2/jquery.maskMoney.min.js"></script>
        <script src="../Source Files/jquery-ui.min.js"></script>
    </head>
    <body id="tudo">

        <%@include file="CabecalhoCliente.jsp"%>

        <div class="container">

            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
               
            </div>

        </div>
        <div class="container">

            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo">Editar um PET</h1>
            </div>

        </div>

        <%@include file="menuLateralCliente.jsp"%>

        <form action="../EditarPetServlet" method="post" id="formPet">
            <div id="fotoprod" class="principal col-xs-12 col-sm-6 col-md-6">
                <hr>
                <div class="row">

                    <div class="form-group col-xs-12 col-sm-7 col-md-7" id="titulop">
                        <label>Nome do Pet: *</label>
                        <input type="text" name="nome" <%out.print("value='"+pet.getNome() +"'"); %>class="form-control" id="inputNomePet">
                    </div>
                        <div class="form-group col-xs-12 col-sm-1 col-md-1" id="titulop">
                                <!--Espacamento-->
                        </div>
                    <div class="form-group col-xs-12 col-sm-4 col-md-4" id="dataV">
                        <div class="form-group " id="data">
                        	<%
                            String data = pet.getDtNascimento();
                            String datanova = "";
                            for(int x = 0; x<data.length();x++){
                               datanova+=data.charAt(x);
                            }
                            String dia=datanova.charAt(8)+""+datanova.charAt(9);
                            String mes =datanova.charAt(5)+""+datanova.charAt(6);
                            String ano =datanova.charAt(0)+"" + datanova.charAt(1)+"" + datanova.charAt(2)+"" + datanova.charAt(3);
                            String dataCerta = dia + mes + ano;                        	
                        	%>
                        
                            <label class="fonte"> Data de Nascimento:*</label>
                            <input type="text" name="data"  <%out.print("value='"+ dataCerta +"'"); %> class="form-control" id="inputDataV">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group col-xs-12 col-sm-4 col-md-4" id="optionTipo">
                        <label class="fonte">Tipo *</label>
                        <select class="custom-select" name="tipo" id="inputGroupSelectTipo">
                            <option value="--">--</option>
                            <option value="Cães" <% if(pet.getTipo().equals("Cães")) out.print("selected"); %>>Cães</option>
                            <option value="Gatos" <% if(pet.getTipo().equals("Gatos")) out.print("selected"); %>>Gatos</option>
                            <option value="Pássaros" <% if(pet.getTipo().equals("Pássaros")) out.print("selected"); %>>Pássaros</option>
                            <option value="Hamsters" <% if(pet.getTipo().equals("Hamsters")) out.print("selected"); %>>Hamsters</option>
                        </select>
                    </div>
                    <div class="form-group col-xs-12 col-sm-4 col-md-4" id="optionPorte">
                        <label class="fonte">Porte *</label>
                        <select class="custom-select" name="porte" id="inputGroupSelectPorte">
                            <option value="--">--</option>
                            <option value="Pequeno" <% if(pet.getPorte().equals("Pequeno")) out.print("selected"); %>>Pequeno</option>
                            <option value="Médio" <% if(pet.getPorte().equals("Médio")) out.print("selected"); %>>Médio</option>
                            <option value="Grande" <% if(pet.getPorte().equals("Grande")) out.print("selected"); %>>Grande</option>
                        </select>
                    </div>
                    <div class="form-group col-xs-12 col-sm-4 col-md-4">
                        <div class="form-group " id="data">
                            <label>Raça:</label>
                            <input type="text" name="raca"  <%out.print("value='"+pet.getRaca()+"'"); %> class="form-control" id="inputRaca">
                        </div>
                    </div>
                </div>
                <div class="form-group col-xs-12 col-sm-12 col-md-12" id="descri">
                    <label for="exampleFormControlTextarea1">Observações</label>
                    <textarea class="form-control" name="observacao"  
                              id="inputObservacao" rows="4"  maxlength="270" placeholder="Descreva umas observações importantes do seu PET com até 270 caracteres."><%out.print(pet.getObs()); %></textarea>
                </div>

                    <hr>

                <div class="row">                       
                    <div class="form-group col-xs-12 col-sm-12 col-md-12">
                        <button type="submit" name="opcao" id="salvar_pet" class=" btn2 btn btn-success float-right " value="salvar">Salvar</button>
                        <button type="button" name="opcao" id="cancelarCadPet" class=" btn2 btn btn-cancel float-right" value="cancelar">Cancelar</button>
                    </div> 

                    <!-- <a href="MeusProdutos.jsp" class="btn2 btn btn-success">Cancelar</a>-->
                </div>
            </div>
        </form>   
        <%@include file="rodape.jsp"%>	
        <script type="text/javascript" src="../js/cadastrarPet.js" charset="utf-8"></script> 
        <script type="text/javascript" charset="utf-8">
            
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
                    window.location.href="CadastroPetImagem.jsp?status=OKedit&id=<%=idEdit%>";
                }else{
                     window.location.href="MeusPets.jsp?status=OKedit";
                }
            <%}%>           
            }
            ;
            <%}%>
            
        </script> 
  
    </body>
</html>
