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

$(function () {
    $("#salvar_acessorio").click(function () {
        if (validaCampo() === true) {
            $("#formAcessorio").submit();
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
    

    if ($("#txtdescricao").val() === "") {
        alert("Por favor, preencher a descrição do produto");
        $("#txtdescricao").css("border", "1px solid red");
        $("#txtdescricao").focus();
        return false;
    }
    if ($("#txtcontrain").val() === "") {
        alert("Por favor, informar a contra indicação do produto");
        $("#txtcontrain").css("border", "1px solid red");
        $("#txtcontrain").focus();
        return false;
    }
    
    if ($("#inputPrecoA").val() == "") {
        alert("Por favor, informe um valor para seu produto.");
        $("#inputPrecoA").css("border", "1px solid red");
        $("#inputPrecoA").focus();
        return false;
    }
    
    if ($("#inputPrecoA").val()=== "0,00") {
        alert("Por favor, informe um valor para seu produto.");
        $("#inputPrecoA").css("border", "1px solid red");
        $("#inputPrecoA").focus();
        return false;
    }
    if ($("#inputEstoqueA").val() === "") {
        alert("Por favor, informar quantidade em estoque");
        $("#inputEstoqueA").css("border", "1px solid red");
        $("#inputEstoqueA").focus();
        return false;
    }
    //$("#txtIngredientes").css("border", "1px solid #ced4da");
    

    //$("#inputDataV").css("border", "1px solid #ced4da");

    // censura de idade 18
   /* var data = new Date();
    var anoAtual = data.getFullYear();
    var regData = /([^\d])+/g;

    if (anoAtual - parseInt($('#inputDataV').val().replace(regData, "").substring(4, 8)) >= 0) {
        $("#inputDataV").datepicker("hide");
        //$("#inputData").val('');
        alert('A data do produto consta vencido, por favor, cadastrar outro produto com um vencimento válido');
        return false;
    }*/

    return true;
}


