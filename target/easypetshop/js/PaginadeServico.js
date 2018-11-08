window.onload = function () {
    $(function () {
        $("#salvar_agendamento").click(function () {
            if (validaCampo() === true) {
                $("#formAgendamento").submit();
            }
        });

        $("#inputGroupSelectPets").change(function(){
            selectPet($("#inputGroupSelectPets").val());
        });
        
        $("#inputGroupSelectDias").change(function(){
            getHorasDisponiveis($("#inputGroupSelectDias").val());
        });
    });
};

function selectPet(selectedVal) {
    $.ajax({
        method: "POST",
        url: "../InformacoesPetJSONServlet",
        data: {idPet: selectedVal}
    }).done(function (data) {
        $("#inputAnimalTipo").val(data.nome);
        $("#inputPorte").val(data.porte);
    });
}

function getHorasDisponiveis(selectedData){
    var idServico = $("#idServico").val();
    
    $.ajax({
        method: "POST",
        url: "../HorarioDeServicoJSONServlet",
        data: {
            dataSelecionada: selectedData,
            idServico: idServico
        }
    }).done(function (data) {
        $("#inputGroupSelectHoras option").remove();
        $("#inputGroupSelectHoras").append("<option value=\"--\" selected=\"selected\">--</option>");
        var option = "";
        for(var i = 0; i< data.length; i++){
            var item = data[i];
            var minute = item.time.minute + "";
            var hour = item.time.hour + "";
            
            if(minute.length < 2){
                minute = "0" + minute;
            }

            if(hour.length < 2){
                hour = "0" + hour;
            }

            option = "<option value=\"" + hour + ":" + minute + "\" selected=\"selected\">"+ hour + ":" + minute +"</option>";       
            $("#inputGroupSelectHoras").append(option);
        }
    });
}

function validaCampo() {

    //Valida campos em branco

    if ($("#inputGroupSelectPets").prop("selectedIndex") === 0) {
        alert("Por favor, selecione um Pet");
        $("#inputGroupSelectPets").css("border", "1px solid red");
        $("#inputGroupSelectPets").focus();
        return false;
    }

    $("#inputGroupSelectPets").css("border", "1px solid #ced4da");

    if ($("#inputGroupSelectDias").prop("selectedIndex") === 0) {
        alert("Por favor, selecione um dia disponível");
        $("#inputGroupSelectDias").css("border", "1px solid red");
        $("#inputGroupSelectDias").focus();
        return false;
    }

    $("#inputGroupSelectDias").css("border", "1px solid #ced4da");

    if ($("#inputGroupSelectHoras").prop("selectedIndex") === 0) {
        alert("Por favor, selecione uma hora disponível");
        $("#inputGroupSelectHoras").css("border", "1px solid red");
        $("#inputGroupSelectHoras").focus();
        return false;
    }

    $("#inputGroupSelectHoras").css("border", "1px solid #ced4da");




    return true;
}


