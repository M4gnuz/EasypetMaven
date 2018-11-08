
window.onload = function () {

    //mascaras de campos específicos
    $("#inputData").mask("99/99/9999");
    $('#inputCep').mask("99999-999");
    $("#inputTelefone").mask("(99) 9999-9999?9");
    $("#inputCpf").mask("999.999.999-99");
    

    //Valida campos só letra
    $("#inputNome").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputSNome").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });


}


$(function () {
    $("#cadastrarAdmin").click(function () {
        if (validaCampo() == true) {
            $("#formulario").submit();
        }

    });
});




$(function () {
    $("#cancelarCadCliente").click(function () {
        window.history.go(-1);
    });
});


function validaCampo() {

    //Valida campos em branco

    if ($("#inputNome").val() == "") {
        alert("Por favor, preencher o campo nome");
        $("#inputNome").css("border", "1px solid red");
        $("#inputNome").focus();
        return false
    }
    $("#inputNome").css("border", "1px solid #ced4da");

    if ($("#inputSNome").val() == "") {
        alert("Por favor, preencher o campo sobrenome");
        $("#inputSNome").css("border", "1px solid red");
        $("#inputSNome").focus();
        return false
    }
    $("#inputSNome").css("border", "1px solid #ced4da");

    var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

    if ($("#inputEmail").val() == "") {
        alert("Por favor, preencher o campo email");
        $("#inputEmail").css("border", "1px solid red");
        $("#inputEmail").focus();
        return false
    }
    if (!reg.test($("#inputEmail").val())) {
        $("#inputEmail").css("border", "1px solid red");
        $("#inputEmail").focus();
        alert("Por favor, preencher um email válido");
        return false;
    }
    $("#inputData").css("border", "1px solid #ced4da");

    if ($("#inputData").val() == "") {
        alert("Por favor, preencher o campo data de nascimento");
        $("#inputData").css("border", "1px solid red");
        $("#inputData").focus();
        return false
    }

    $("#inputData").css("border", "1px solid #ced4da");


    // censura de idade 18
    var data = new Date();
    var anoAtual = data.getFullYear();
    var regData = /([^\d])+/g;

    if (anoAtual - parseInt($('#inputData').val().replace(regData, "").substring(4, 8)) < 18) {
        $("#inputData").datepicker("hide");
        //$("#inputData").val('');
        alert('É necessário ser maior de idade para se cadastrar');
        return false;
    }



    if ($("#inputSenha").val() == "") {
        alert("Por favor, preencher o campo senha");
        $("#inputSenha").css("border", "1px solid red");
        $("#inputSenha").focus();
        return false
    }
    $("#inputSenha").css("border", "1px solid #ced4da");

    if ($("#inputCsenha").val() == "") {
        alert("Por favor, preencher o campo senha novamente");
        $("#inputCsenha").css("border", "1px solid red");
        $("#inputCsenha").focus();
        return false
    }
    $("#inputCsenha").css("border", "1px solid #ced4da");


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


    if ($("#inputTelefone").val() == "") {
        alert("Por favor, preencher o campo telefone");
        $("#inputTelefone").css("border", "1px solid red");
        $("#inputTelefone").focus();
        return false
    }
    $("#inputTelefone").css("border", "1px solid #ced4da");

    if ($("#inputData").val() == "") {
        alert("Por favor, preencher o campo data");
        $("#inputData").css("border", "1px solid red");
        $("#inputData").focus();
        return false
    }
    $("#inputData").css("border", "1px solid #ced4da");



    //Valida sexo
    var selecionado = false;
    if ($("#customRadio1").prop("checked") || $("#customRadio2").prop("checked")) {
        selecionado = true;
    } else {
        alert("Selecione a opção de sexo");
        return false;
    }


    //valida se a senha tem no mínimo 8 caracteres

    if ($('#inputSenha').val().trim().length < 8) {
        alert('A senha deverá conter no minimo 8 caracteres');
        return false;
    }

    //Valida senha se sao iguais
    senha = document.getElementById('inputSenha').value;
    confirSenha = document.getElementById('inputConfirmasenha').value;
    if (senha != confirSenha) {
        alert("Senhas diferentes, por favor digitar as senhas iguais.");
        return false;
    }


    return true;
}

var btn = document.getElementById("btn-modal-senha");
var span = document.getElementsByClassName("close")[0];
var modal = document.getElementById('myModal');


/*Modal Senha*/
$(function () {
    $("#btn-modal-senha").click(function () {
        $("#modalSenha").css("display", "block");
    });
});

$(function () {
    $(".close").click(function () {
        $("#modalSenha").css("display", "none");
    });
});



