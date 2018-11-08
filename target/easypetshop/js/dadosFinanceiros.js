$("#cancelarfinanceiro").click(function () {
    $(location).attr("href", "Home.jsp");
});


window.onload = function () {

    //mascaras de campos específicos
    $("#inputNumeroCartao").mask("9999.9999.9999.9999");
    $("#inputCpf").mask("999.999.999-99");
    $("#inputValidade").mask("99/9999");

    $("#inputNome").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputParcelas").on("input", function () {
        var regex = /[^0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputCodSeguranca").on("input", function () {
        var regex = /[^0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

$('#element').click(function() {
   if($('#radio_button').is(':checked')) { alert("it's checked"); }
});

    $(function () {
        $("#finalizar").click(function () {
            if (validaCampoFormaPagamento() == true) {
               if($('#rdbCredito').is(':checked')) {
                    if (validaCampo() == true) {
                        $("#formulario").submit();
                    }
                }else{
                    $("#formulario").submit();
                }
            }

        });
    });

}

$(function () {
    $("#btnSalvarFinanceiro").click(function () {
        if (validaCampo() == true) {
            $("#formulario").submit();
        }

    });
});

function validaCampo() {

    //Valida campos em branco


    if ($("#inputNumeroCartao").val() == "") {
        alert("Por favor, preencher o número do cartão para prosseguir");
        $("#inputNumeroCartao").css("border", "1px solid red");
        $("#inputNumeroCartao").focus();
        return false
    }

    $("#inputNumeroCartao").css("border", "1px solid #ced4da");

    if ($("#inputNome").val() == "") {
        alert("Por favor, preencher o campo nome impresso no cartão para prosseeguir");
        $("#inputNome").css("border", "1px solid red");
        $("#inputNome").focus();
        return false
    }
    $("#inputValidade").css("border", "1px solid #ced4da");

    if ($("#inputValidade").val() == "") {
        alert("Por favor, preencher o campo validade para prosseguir");
        $("#inputValidade").css("border", "1px solid red");
        $("#inputValidade").focus();
        return false
    }
    $("#inputValidade").css("border", "1px solid #ced4da");

    if ($("#inputCodSeguranca").val() == "") {
        alert("Por favor, preencher o campo código de segurança para prosseguir");
        $("#inputCodSeguranca").css("border", "1px solid red");
        $("#inputCodSeguranca").focus();
        return false
    }
    $("#inputCodSeguranca").css("border", "1px solid #ced4da");


    if ($("#inputCpf").val() == "") {
        alert("Por favor, preencher o campo CPF do titular para prosseguir");
        $("#inputCpf").css("border", "1px solid red");
        $("#inputCpf").focus();
        return false
    }
    $("#inputCpf").css("border", "1px solid #ced4da");

    //VALIDA EXISTENCIAS DE CPF INICIO
    var reg = /([^\d])+/g;
    var strCPF = $("#inputCpf").val();
    strCPF = strCPF.replace(reg, "");

    var Soma;
    var Resto;
    Soma = 0;
    if (strCPF == "00000000000" ||
            strCPF == "11111111111" ||
            strCPF == "22222222222" ||
            strCPF == "33333333333" ||
            strCPF == "44444444444" ||
            strCPF == "55555555555" ||
            strCPF == "66666666666" ||
            strCPF == "77777777777" ||
            strCPF == "88888888888" ||
            strCPF == "99999999999") {
        alert("Por favor digite um CPF válido");
        $("#inputCpf").focus();
        return false;
    }
    for (i = 1; i <= 9; i++)
        Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (11 - i);
    Resto = (Soma * 10) % 11;
    if ((Resto == 10) || (Resto == 11))
        Resto = 0;
    if (Resto != parseInt(strCPF.substring(9, 10))) {
        alert("Por favor, digite um CPF válido");
        $("#inputCpf").focus();
        return false;
    }

    Soma = 0;
    for (i = 1; i <= 10; i++)
        Soma = Soma + parseInt(strCPF.substring(i - 1, i)) * (12 - i);
    Resto = (Soma * 10) % 11;

    if ((Resto == 10) || (Resto == 11))
        Resto = 0;
    if (Resto != parseInt(strCPF.substring(10, 11))) {
        alert("Por favor, digite um CPF válido");
        $("#inputCpf").focus();
        return false;
    }

    //VALIDA EXISTENCIAS DE CPF FIIIM
    
        if ($("#inputParcelas").val() == "") {
        alert("Por favor, preencher o campo parcelas para prosseguir");
        $("#inputParcelas").css("border", "1px solid red");
        $("#inputParcelas").focus();
        return false
    }
    $("#inputParcelas").css("border", "1px solid #ced4da");

    return true;
}
