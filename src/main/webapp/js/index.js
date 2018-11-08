
$(function() {
    $("#entrarCliente").click(function() {
        if (validaCampoCliente() == true) {
            $("#formLogin").submit();
        }
    });
});


$(function() {
    $("#entrarFornecedor").click(function() {
        if (validaCampoFornecedor() == true) {
            $("#formularioFornecedor").submit();
        }
    });
});

function validaCampoCliente() {
    //Valida campos em branco
    if ($("#inputEmailLogin").val() == "") {
        alert("Por favor, preencher o campo email");
        $("#inputEmailLogin").css("border", "1px solid red");
        $("#inputEmailLogin").focus();
        return false
    } else {
        $("#inputEmailLogin").css("border", "1px solid #ced4da");
    }

    if ($("#inputSenhaLogin").val() == "") {
        alert("Por favor, preencher o campo senha");
        $("#inputSenhaLogin").css("border", "1px solid red");
        $("#inputSenhaLogin").focus();
        return false
    } else {
        $("#inputSenhaLogin").css("border", "1px solid #ced4da");
    }
    
    return true;
}

function validaCampoFornecedor() {

    //Valida campos em branco
    if ($("#inputEmailFornecedor").val() == "") {
        alert("Por favor, preencher o campo email");
        $("#inputEmailFornecedor").css("border", "1px solid red");
        $("#inputEmailFornecedor").focus();
        return false;
    } else {
        $("#inputEmailFornecedor").css("border", "1px solid #ced4da");
    }

    if ($("#inputSenhaFornecedor").val() == "") {
        alert("Por favor, preencher o campo senha");
        $("#inputSenhaFornecedor").css("border", "1px solid red");
        $("#inputSenhaFornecedor").focus();
        return false;
    } else {
        $("#inputSenhaFornecedor").css("border", "1px solid #ced4da");
        return true;
    }

}
