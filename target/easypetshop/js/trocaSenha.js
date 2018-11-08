window.onload = function () {

    $(function () {
        $("#btn_salvarNovaSenha").click(function () {
            if (validaCampo() == true) {
                $("#formulario").submit();
            }

        });
    });

}


function validaCampo() {

    if ($("#inputAntigaSenha").val() == "") {
        alert("Por favor, preencher o campo de senha antiga");
        $("#inputAntigaSenha").css("border", "1px solid red");
        $("#inputAntigaSenha").focus();
        return false;
    }
    $("#inputAntigaSenha").css("border", "1px solid #ced4da");


    if ($("#inputNovaSenha").val() == "") {
        alert("Por favor, preencher o campo de senha nova");
        $("#inputNovaSenha").css("border", "1px solid red");
        $("#inputNovaSenha").focus();
        return false;
    }
    $("#inputNovaSenha").css("border", "1px solid #ced4da");
    
        if ($('#inputNovaSenha').val().trim().length < 8) {
        alert('A senha deverá conter no minimo 8 caracteres');
        return false;
    }


    if ($("#inputNovaSenhaConfir").val() == "") {
        alert("Por favor, preencher o campo de senha nova de confirmação");
        $("#inputNovaSenhaConfir").css("border", "1px solid red");
        $("#inputNovaSenhaConfir").focus();
        return false;
    }
    $("#inputNovaSenhaConfir").css("border", "1px solid #ced4da");
    
        //Valida senha se sao iguais
    senha = document.getElementById('inputNovaSenha').value;
    confirSenha = document.getElementById('inputNovaSenhaConfir').value;
    if (senha != confirSenha) {
        alert("Senhas diferentes, por favor digitar as senhas iguais.");
        return false;
    }


    return true;
}
