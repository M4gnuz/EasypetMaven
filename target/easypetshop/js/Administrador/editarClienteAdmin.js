
window.onload = function () {

    //mascaras de campos específicos
    $('#inputCep').mask("99999-999");
    $("#inputTelefone").mask("(99) 9999-9999?9");
    $("#inputCpf").mask("999.999.999-99");
    $("#inputData").mask("99/99/9999");

    //Valida campos só letra
    $("#inputNome").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputSNome").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputBairro").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    $("#inputCidade").on("input", function () {
        var regex = /[0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });

    //valida campos só numero

    $("#inputNumero").on("input", function () {
        var regex = /[^0-9]/g;
        $(this).val($(this).val().replace(regex, ''));
    });


    //COMPLETA ENDERECO

    var regex = /^[0-9]{8}$/;

    $(function () {
        $(".cep").on("change", function () {
            getEndereco();
        });
    });

    function getEndereco() {    
        $(".cep").attr("readonly", "readonly");

        var cep = $(".cep").val().replace(/\D/g, '');

        if (cep != "" && regex.test(cep)) {
            $.get('https://viacep.com.br/ws/' + cep + '/json/', function (json) {
                if (!("erro" in json)) {
                    var e = eval(json);
                    console.log("entrou no if ");
                    console.log(e);


                    $("#inputEndereco").val(e.logradouro);
                    $("#inputBairro").val(e.bairro);
                    $("#inputCidade").val(e.localidade);

                    $("#inputEndereco").attr("readonly", "readonly");
                    $("#inputBairro").attr("readonly", "readonly");
                    $("#inputCidade").attr("readonly", "readonly");
                    
                    $("#inputCep").css("border", "1px solid #ced4da");

                } else {
                    //limpar();
                    $("#inputCep").val("");
                    $("#inputCep").css("border", "1px solid red");
                    $("#inputCep").focus();
                    alert("Este CEP não existe!");
                }
            });
        } else {
            $("#inputCep").val("");
            //limpar();
        }

        $(".cep").removeAttr("readonly");
    }

}


$(function () {
    $("#Cadastrar").click(function () {
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


    if ($("#inputCpf").val() == "") {
        alert("Por favor, preencher o campo CPF");
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

    if ($("#inputCep").val() == "") {
        alert("Por favor, preencher o campo CEP");
        $("#inputCep").css("border", "1px solid red");
        $("#inputCep").focus();
        return false
    }
    $("#inputCep").css("border", "1px solid #ced4da");

    if ($("#inputEnd").val() == "") {
        alert("Por favor, preencher o campo endereço");
        $("#inputEnd").css("border", "1px solid red");
        $("#inputEnd").focus();
        return false
    }




    $("#inputEnd").css("border", "1px solid #ced4da");

    if ($("#inputNumero").val() == "") {
        alert("Por favor, preencher o campo número");
        $("#inputNumero").css("border", "1px solid red");
        $("#inputNumero").focus();
        return false
    }
    $("#inputNumero").css("border", "1px solid #ced4da");


    if ($("#inputBairro").val() == "") {
        alert("Por favor, preencher o campo bairro");
        $("#inputBairro").css("border", "1px solid red");
        $("#inputBairro").focus();
        return false
    }
    $("#inputBairro").css("border", "1px solid #ced4da");

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


/*            $(function(){
 $(window).click(function(){
 if (event.target == modal) {
 $("#modalSenha").css("display","none");
 }                               
 });	
 
 });*/


/*Modal Termos de uso*/
$(function () {
    $("#btn-termos-uso").click(function () {
        $("#modalTermos").css("display", "block");
    });
});

$(function () {
    $(".close").click(function () {
        $("#modalTermos").css("display", "none");
    });
});

