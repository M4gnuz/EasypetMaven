
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

                    $("#inputEndereco").val(e.logradouro);
                    $("#inputBairro").val(e.bairro);
                    $("#inputCidade").val(e.localidade);

                    $("#inputEndereco").attr("readonly", "readonly");
                    $("#inputBairro").attr("readonly", "readonly");
                    $("#inputCidade").attr("readonly", "readonly");

                } else {
                    limpar();
                }
            });
        } else {
            limpar();
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
  

    //VALIDA EXISTENCIAS DE CPF FIIIM


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

    //Valida sexo
    var selecionado = false;
    if ($("#customRadio1").prop("checked") || $("#customRadio2").prop("checked")) {
        selecionado = true;
    } else {
        alert("Selecione 1 opção de sexo");
        return false;
    }



    //valida se a senha tem no mínimo 8 caracteres

    if ($('#inputSenha').val().trim().length < 8) {
        alert('A senha deverá ter no minimo 8 caracteres');
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


