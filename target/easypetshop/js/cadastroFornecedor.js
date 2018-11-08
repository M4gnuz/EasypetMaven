window.onload = function () {

    //mascaras de campos específicos
    $('#inputCep').mask("99999-999");
    $("#inputTelefone").mask("(99) 9999-9999?9");
    $("#inputCnpj").mask("99.999.999/9999-99");
    $("#inputData").mask("99/99/9999");
    $("#inputHorarioInicio").mask("99:99");
    $("#inputHorarioFim").mask("99:99");

    //Valida campos só letra
    $("#inputNome").on("input", function () {
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

    /*
     $(function () {
     $("#inputData").datepicker();
     });
     
     */
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
    $("#CadastrarFornecedor").click(function () {
        if (validaCampo() == true) {
            $("#formulario").submit();
        }
    });
});

$(function () {
    $("#cancelarCadFornecedor").click(function () {
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

    if ($("#inputRazaoSocial").val() == "") {
        var correcao = "Por favor, preencher o campo razão social";
        alert(correcao);
        $("#inputRazaoSocial").css("border", "1px solid red");
        $("#inputRazaoSocial").focus();
        return false
    }
    $("#inputRazaoSocial").css("border", "1px solid #ced4da");

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
    $("#inputEmail").css("border", "1px solid #ced4da");

    if ($("#inputData").val() == "") {
        alert("Por favor, preencher o campo data de abertura");
        $("#inputData").css("border", "1px solid red");
        $("#inputData").focus();
        return false
    }
    $("#inputData").css("border", "1px solid #ced4da");


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


    if ($("#inputCnpj").val() == "") {
        alert("Por favor, preencher o campo CNPJ");
        $("#inputCnpj").css("border", "1px solid red");
        $("#inputCnpj").focus();
        return false
    }
    $("#inputCnpj").css("border", "1px solid #ced4da");

    // VALIDA SE CNPJ EXISTE INICIO SCRIPT
    var reg = /([^\d])+/g;
    var cnpj = $("#inputCnpj").val();
    cnpj = cnpj.replace(reg, "");



    // Elimina CNPJs invalidos conhecidos
    if (cnpj == "00000000000000" ||
            cnpj == "11111111111111" ||
            cnpj == "22222222222222" ||
            cnpj == "33333333333333" ||
            cnpj == "44444444444444" ||
            cnpj == "55555555555555" ||
            cnpj == "66666666666666" ||
            cnpj == "77777777777777" ||
            cnpj == "88888888888888" ||
            cnpj == "99999999999999") {
        alert("Por favor, digite um CNPJ válido");
        $("#inputCnpj").focus();
        return false;
    }


    // Valida DVs
    tamanho = cnpj.length - 2
    numeros = cnpj.substring(0, tamanho);
    digitos = cnpj.substring(tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(0)) {
        alert("Por favor, digite um CNPJ válido");
        $("#inputCnpj").focus();
        return false;
    }

    tamanho = tamanho + 1;
    numeros = cnpj.substring(0, tamanho);
    soma = 0;
    pos = tamanho - 7;
    for (i = tamanho; i >= 1; i--) {
        soma += numeros.charAt(tamanho - i) * pos--;
        if (pos < 2)
            pos = 9;
    }
    resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
    if (resultado != digitos.charAt(1)) {
        alert("Por favor, digite um CNPJ válido");
        $("#inputCnpj").focus();
        return false;
    }

    //VALIDA SE CNPJ EXISTE FIM SCRIPT


    if ($("#inputTelefone").val() == "") {
        alert("Por favor, preencher o campo telefone");
        $("#inputTelefone").css("border", "1px solid red");
        $("#inputTelefone").focus();
        return false
    }
    $("#inputTelefone").css("border", "1px solid #ced4da");

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

    if ($("#inputHorarioInicio").val() == "") {
        alert("Por favor, preencher o horário de início");
        $("#inputHorarioInicio").css("border", "1px solid red");
        $("#inputHorarioInicio").focus();
        return false
    }
    $("#inputHorarioInicio").css("border", "1px solid #ced4da");

    if ($("#inputHorarioFim").val() == "") {
        alert("Por favor, preencher o horário de término");
        $("#inputHorarioFim").css("border", "1px solid red");
        $("#inputHorarioFim").focus();
        return false
    }
    $("#inputHorarioFim").css("border", "1px solid #ced4da");


    if ($("#inoutDescricaoFornecedor").val() == "") {
        alert("Por favor, preencher o campo de descrição da loja");
        $("#inoutDescricaoFornecedor").css("border", "1px solid red");
        $("#inoutDescricaoFornecedor").focus();
        return false
    }
    $("#inoutDescricaoFornecedor").css("border", "1px solid #ced4da");

    //valida se o termos de uso está selecionado
    var checado = false;

    if ($("#exampleCheck1").is(":checked")) {
        checado = true;
    } else {
        alert("É necessário confirmar os termos de uso para prosseguir");
        return false;
    }

    var checado2 = false;

    if ($("#exampleCheck2").is(":checked")) {
        checado2 = true;
    } else {
        alert("É necessário confirmar os pré requisitos para prosseguir");
        return false;
    }

    //valida se a senha tem no mínimo 8 caracteres

    if ($('#inputSenha').val().trim().length < 8) {
        alert('A senha deverá conter no mínimo 8 caracteres');
        return false;
    }

    //Valida senha se sao iguais
    senha = document.getElementById('inputSenha').value;
    confirSenha = document.getElementById('inputConfsenha').value;
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

/*Modal Pré Requisitos*/
$(function () {
    $("#btn-pre-requesitos").click(function () {
        $("#modalRequisitos").css("display", "block");
    });
});

$(function () {
    $(".close").click(function () {
        $("#modalRequisitos").css("display", "none");
    });
});

   