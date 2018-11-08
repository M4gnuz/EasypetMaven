window.onload = function () {
    $("#inputTelefoneTC").mask("(99) 99999-9999");

    $(function () {
        $("#btn_enviarEC").click(function () {
            if (validaCampo() == true) {
                $("#formulario").submit();
            }

        });
    });

}


function validaCampo() {

    if ($("#inputNomeTC").val() == "") {
        alert("Por favor, preencher o campo nome");
        $("#inputNomeTC").css("border", "1px solid red");
        $("#inputNomeTC").focus();
        return false;
    }
    $("#inputNomeTC").css("border", "1px solid #ced4da");

    var reg = /^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;

    if ($("#inputEmailTC").val() == "") {
        alert("Por favor, preencher o campo email");
        $("#inputEmailTC").css("border", "1px solid red");
        $("#inputEmailTC").focus();
        return false;
    }
    if (!reg.test($("#inputEmailTC").val())) {
        $("#inputEmailTC").css("border", "1px solid red");
        $("#inputEmailTC").focus();
        alert("Por favor, preencher um email válido");
        return false;
    }
    $("#inputEmailTC").css("border", "1px solid #ced4da");

    if ($("#inputTelefoneTC").val() == "") {
        alert("Por favor, preencher o campo telefone");
        $("#inputTelefoneTC").css("border", "1px solid red");
        $("#inputTelefoneTC").focus();
        return false;
    }
    $("#inputTelefoneTC").css("border", "1px solid #ced4da");


    if ($("#inputAreaInteresse").val() == "") {
        alert("Por favor, preencher o campo de áre de interesse");
        $("#inputAreaInteresse").css("border", "1px solid red");
        $("#inputAreaInteresse").focus();
        return false;
    }
    $("#inputAreaInteresse").css("border", "1px solid #ced4da");


    return true;
}
