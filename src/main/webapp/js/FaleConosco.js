window.onload = function () {
    $("#inputTelefone").mask("(99) 99999-9999");

    $(function () {
        $("#btn_enviarFormularioDeDuvidas").click(function () {
            if (validaCampo() == true) {
                $("#formulario").submit();
            }

        });
    });

}




function validaCampo() {

    if ($("#inputNome").val() == "") {
        alert("Por favor, preencher o campo nome");
        $("#inputNome").css("border", "1px solid red");
        $("#inputNome").focus();
        return false
    }
    $("#inputNome").css("border", "1px solid #ced4da");

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

    if ($("#inputTelefone").val() == "") {
        alert("Por favor, preencher o campo telefone");
        $("#inputTelefone").css("border", "1px solid red");
        $("#inputTelefone").focus();
        return false
    }
    $("#inputTelefone").css("border", "1px solid #ced4da");


    if ($("#inputAssunto").val() == "") {
        alert("Por favor, preencher o campo assunto");
        $("#inputAssunto").css("border", "1px solid red");
        $("#inputAssunto").focus();
        return false
    }
    $("#inputAssunto").css("border", "1px solid #ced4da");

    if ($("#inputMotivo").val() == "") {
        alert("Por favor, preencher o campo motivo");
        $("#inputMotivo").css("border", "1px solid red");
        $("#inputMotivo").focus();
        return false
    }
    $("#inputMotivo").css("border", "1px solid #ced4da");

    if ($("#inputDescricao").val() == "") {
        alert("Por favor, preencher o campo descrição");
        $("#inputDescricao").css("border", "1px solid red");
        $("#inputDescricao").focus();
        return false
    }
    $("#inputDescricao").css("border", "1px solid #ced4da");

    return true;

}
