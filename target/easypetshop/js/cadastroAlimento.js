window.onload = function () {


    $(function () {
        var maxLength = '-0.000,00'.length;

        $("#inputPrecoA").maskMoney({
            allowNegative: true,
            thousands: '.',
            decimal: ',',
            affixesStay: false
        }).attr('maxlength', maxLength).trigger('mask.maskMoney');
    });
    
    $("#inputEstoqueA").on("input", function () {
        var regex = /[^0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });


    $("#inputDataV").mask("99/99/9999");

/*
     comentei o calendario
    $(function () {
        $("#inputDataV").datepicker();
    });
*/

    $(function () {
        $("#salvar_alimento").click(function () {
            if (validaCampo() === true) {
                $("#formAlimento").submit();
            }
        });
    });


};

function validaCampo() {

    //Valida campos em branco
    if ($("#inputTitulo").val() === "") {
        alert("Por favor, preencher o campo título do produto");
        $("#inputTitulo").css("border", "1px solid red");
        $("#inputTitulo").focus();
        return false;
    }

    $("#inputTitulo").css("border", "1px solid #ced4da");

    /*if ($("#contraindicacao").val() === "") {
     alert("Por favor, preencher a descrição");
     $("#contraindicacao").css("border", "1px solid red");
     $("#contraindicacao").focus();
     return false;
     }
     
     $("#contraindicacao").css("border", "1px solid #ced4da");*/

    if ($("#txtdescricao").val() === "") {
        alert("Por favor, preencher o campo descrição");
        $("#txtdescricao").css("border", "1px solid red");
        $("#txtdescricao").focus();
        return false;
    }
    $("#txtdescricao").css("border", "1px solid #ced4da");

    if ($("#txtcontrain").val() === "") {
        alert("Por favor, preencher a contra indicação do produto");
        $("#txtcontrain").css("border", "1px solid red");
        $("#txtcontrain").focus();
        return false;
    }
    $("#txtcontrain").css("border", "1px solid #ced4da");


    if ($("#txtIngredientes").val() === "") {
        alert("Por favor, preencha os ingredientes");
        $("#txtIngredientes").css("border", "1px solid red");
        $("#txtIngredientes").focus();
        return false;
    }
    $("#txtIngredientes").css("border", "1px solid #ced4da");

    if ($("#inputPrecoA").val() == "") {
        alert("Por favor, preencher o campo preço");
        $("#inputPrecoA").css("border", "1px solid red");
        $("#inputPrecoA").focus();
        return false;
    }

    if ($("#inputPrecoA").val() === "0,00") {
        alert("Por favor, preencher o campo preço");
        $("#inputPrecoA").css("border", "1px solid red");
        $("#inputPrecoA").focus();
        return false;
    }
    $("#inputPrecoA").css("border", "1px solid #ced4da");

    if ($("#inputEstoqueA").val() === "") {
        alert("Por favor, informe a quantidade em estoque.");
        $("#inputEstoqueA").css("border", "1px solid red");
        $("#inputEstoqueA").focus();
        return false;
    }

    $("#inputEstoqueA").css("border", "1px solid #ced4da");


    if ($("#inputDataV").val() === "") {
        alert("Por favor, preencher o campo título da data do vencimento");
        $("#inputDataV").css("border", "1px solid red");
        $("#inputDataV").focus();
        return false;
    }

    $("#inputDataV").css("border", "1px solid #ced4da");

   // produto vencido
    var data = new Date();
    var anoAtual = data.getFullYear();
    var regData = /([^\d])+/g;

/*
    if (anoAtual - parseInt($('#inputDataV').val().replace(regData, "").substring(4, 8)) >= 0) {
      //  $("#inputDataV").datepicker("hide");
        //$("#inputData").val('');
        alert('A data do produto consta vencido, por favor, cadastrar outro produto com um vencimento válido');
        return false;
    }
*/ 
    
    if ($("#inputGroupSelect02").prop("selectedIndex")===0) {
        alert("Por favor, selecionar uma categoria");
        $("#inputGroupSelect02").css("border", "1px solid red");
        $("#inputGroupSelect02").focus();
        return false;
    }

    $("#inputGroupSelect02").css("border", "1px solid #ced4da");


    return true;
}


