window.onload = function () {


    $("#inputDataV").mask("99/99/9999");


    $(function () {
        $("#salvar_pet").click(function () {
            if (validaCampo() === true) {
                $("#formPet").submit();
            }
        });
    });


};

function validaCampo() {

    //Valida campos em branco
    if ($("#inputNomePet").val() === "") {
        alert("Por favor, preencher o campo nome do pet");
        $("#inputNomePet").css("border", "1px solid red");
        $("#inputNomePet").focus();
        return false;
    }

    $("#inputNomePet").css("border", "1px solid #ced4da");

    if ($("#inputDataV").val() === "") {
        alert("Por favor, preencher o campo idade do seu Pet");
        $("#inputDataV").css("border", "1px solid red");
        $("#inputDataV").focus();
        return false;
    }

    $("#inputDataV").css("border", "1px solid #ced4da");

    if ($("#inputGroupSelectTipo").prop("selectedIndex") === 0) {
        alert("Por favor, selecionar um tipo de animal");
        $("#inputGroupSelectTipo").css("border", "1px solid red");
        $("#inputGroupSelectTipo").focus();
        return false;
    }

    $("#inputGroupSelectPorte").css("border", "1px solid #ced4da");

    if ($("#inputGroupSelectPorte").prop("selectedIndex") === 0) {
        alert("Por favor, selecionar um porte para o seu pet");
        $("#inputGroupSelectPorte").css("border", "1px solid red");
        $("#inputGroupSelectPorte").focus();
        return false;
    }

    $("#inputGroupSelectPorte").css("border", "1px solid #ced4da");

    if ($("#inputRaca").val() === "") {
        alert("Por favor, preencher o campo raça");
        $("#inputRaca").css("border", "1px solid red");
        $("#inputRaca").focus();
        return false;
    }
    $("#inputRaca").css("border", "1px solid #ced4da");

    if ($("#inputObservacao").val() === "") {
        alert("Por favor, preencher o campo observação");
        $("#inputObservacao").css("border", "1px solid red");
        $("#inputObservacao").focus();
        return false;
    }
    $("#inputObservacao").css("border", "1px solid #ced4da");



    return true;
}


