
<!DOCTYPE html>

<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro Serviços</title>
        <link rel="stylesheet" type="text/css" href="../css/cadastroServico.css">
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
        <%@include file="cabecalho.jsp"%>

        <div class="container">

            <div id="petlogo" class="principal2  col-xs-12 col-sm-4 col-md-4">
                <h4>Nome PetShop</h4>              
            </div>

        </div>
        <div class="container">

            <div id="logocentral" class="principal2 col-xs-12 col-sm-7 col-md-7">
                <h1 id="nomeTopo"> Tipo de Serviços </h1>
            </div>

        </div>

        <%@include file="menuLateral.jsp"%>

        <form action="../CadastroServicosServlet" method="post" id="formServico">
            <div id="fotoprod" class="principal col-xs-12 col-sm-6 col-md-6">
                <hr>
                <div class="form-group col-xs-12 col-sm-6 col-md-6" id="titulop">
                    <label class="fonte">Serviços: *</label>
                    <select class="custom-select" name="categoria" id="inputGroupSelect02">
                        <option selected>--</option>
                        <option value="Banho">Banho</option>
                        <option value="Tosa">Tosa</option>
                        <option value="Passeios">Passeios</option>
                        <option value="Massagens">Massagens</option>
                        <option value="Banho e Tosa">Banho e Tosa</option>
                    </select>
                </div>
                <div class="form-group col-xs-12 col-sm-11 col-md-11" id="descri">
                    <label for="exampleFormControlTextarea1">Descrição  *</label>
                    <textarea class="form-control" name="descricao" id="txtdescricao" rows="4" maxlength="270" placeholder="Faça uma descrição do serviço com até 270 caracteres."></textarea>
                </div>
                <div class="form-group col-xs-12 col-sm-12 col-md-12">

                    <div class="col-xs-12 col-sm-12 col-md-12 row">
                        <div class="col-xs-12 col-sm-7 col-md-7" id="animaisAtendidos">
                            <label>Animais Atendidos *</label>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <input name="animal" type="checkbox" value="Cão"> Cães 
                                <input name="animal" type="checkbox" value="Gato"> Gatos
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-12">
                                <input name="animal" type="checkbox" value="Pássaros"> Pássaros
                                <input name="animal" type="checkbox" value="Hamsters"> Hamsters
                            </div>
                        </div>
                        <div class="     col-xs-12 col-sm-5 col-md-5" id="portesSuportados">
                            <label>Portes Suportados *</label>
                            <div class="col-xs-12 col-sm-9 col-md-9">
                                <input name="porte" type="checkbox" value="Pequeno"> Pequeno 
                            </div>
                            <div class="col-xs-12 col-sm-9 col-md-9">
                                <input name="porte" type="checkbox" value="Medio"> Médio
                            </div>    
                            <div class="col-xs-12 col-sm-9 col-md-9">
                                <input name="porte" type="checkbox" value="Grande"> Grande
                            </div>   
                        </div>
                    </div>
                </div>

                <hr>

                <div class="row">
                    <div class="form-group col-xs-12 col-sm-3    col-md-3" id="precoA">
                        <div class="form-group " id="preco">
                            <label class="fonte">Preço: *</label>
                            <input type="text" name="precoA" class="form-control" id="inputPrecoA">

                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-3    col-md-3" id="precoA">
                        <div class="form-group " id="preco">
                            <label class="fonte">Entrega: *</label>
                            <input type="text" name="precoB" class="form-control" id="inputPrecoEntrega">

                        </div>
                    </div>
                    <div class="form-group col-xs-12 col-sm-3    col-md-3" id="precoA">
                        <div class="form-group " id="preco">
                            <label class="fonte">Tempo: *</label>
                            <input type="text" width="10px" name="tempo" class="form-control" id="inputHora">
                        </div>
                    </div>
                </div>
            </div>
            <button type="button" id="salvar_servico" class=" btn2 btn btn-success">Salvar</button>
        </div>
    </form>   
    <%@include file="rodape.jsp"%>	
    <script type="text/javascript" src="../js/cadastroServico.js" charset="utf-8"></script>   
</body>
</html>
