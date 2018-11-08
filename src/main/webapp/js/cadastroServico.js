window.onload = function () {

    $("#inputHora").mask("99:99");
    
    $(function () {
        var maxLength = '-0.000,00'.length;

        $("#inputPrecoA").maskMoney({
            allowNegative: true,
            thousands: '.',
            decimal: ',',
            affixesStay: false
        }).attr('maxlength', maxLength).trigger('mask.maskMoney');
    });

    $(function () {
        var maxLength = '-0.000,00'.length;

        $("#inputPrecoEntrega").maskMoney({
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
        $("#salvar_servico").click(function () {
            if (validaCampo() === true) {
                $("#formServico").submit();
            }
        });
    });


};

function validaCampo() {

    //Valida campos em branco

    if ($("#inputGroupSelect02").prop("selectedIndex") === 0) {
        alert("Por favor, selecionar uma categoria");
        $("#inputGroupSelect02").css("border", "1px solid red");
        $("#inputGroupSelect02").focus();
        return false;
    }

    $("#inputGroupSelect02").css("border", "1px solid #ced4da");


    if ($("#txtdescricao").val() === "") {
        alert("Por favor, preencher o campo descrição");
        $("#txtdescricao").css("border", "1px solid red");
        $("#txtdescricao").focus();
        return false;
    }
    $("#txtdescricao").css("border", "1px solid #ced4da");


    var checkboxAnimal = $('input:checkbox[name^=animal]:checked');
    //verifica se existem checkbox selecionados
    if(checkboxAnimal.length <= 0){
        alert("Por favor, selecione pelo menos 1 opção de animal de atendido");
        return false;
      
    }
    
    var checkboxPorte = $('input:checkbox[name^=porte]:checked');
    //verifica se existem checkbox selecionados
    if(checkboxPorte.length <= 0){
        alert("Por favor, selecione pelo menos 1 opção de porte de animal suportado");
        return false;
      
    }

    if ($("#inputPrecoA").val() === "0,00") {
        alert("Por favor, preencher o campo preço");
        $("#inputPrecoA").css("border", "1px solid red");
        $("#inputPrecoA").focus();
        return false;
    }
    $("#inputPrecoA").css("border", "1px solid #ced4da");
    
    if ($("#inputPrecoEntrega").val() === "0,00") {
        alert("Por favor, preencher o campo preço de Entrega, caso seja grátis apenas digite o valor 0!");
        $("#inputPrecoEntrega").css("border", "1px solid red");
        $("#inputPrecoEntrega").focus();
        return false;
    }
    $("#inputPrecoEntrega").css("border", "1px solid #ced4da");

    if ($("#inputEstoqueA").val() === "") {
        alert("Por favor, informe a quantidade em estoque.");
        $("#inputEstoqueA").css("border", "1px solid red");
        $("#inputEstoqueA").focus();
        return false;
    }

    $("#inputEstoqueA").css("border", "1px solid #ced4da");


    if ($("#inputHora").val() === "") {
        alert("Por favor, preencher o campo de hora do serviço");
        $("#inputHora").css("border", "1px solid red");
        $("#inputHora").focus();
        return false;
    }

    $("#inputHora").css("border", "1px solid #ced4da");

    return true;
}


