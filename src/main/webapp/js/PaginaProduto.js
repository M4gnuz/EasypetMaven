function seleciona(name, indice) {
    var imgs = document.querySelectorAll('img[name=' + name + ']');

    for (var i = 0; i < imgs.length; i++) {
        if (i <= indice)
            imgs[i].className = "destaque";
        else
            imgs[i].className = "apagada";
    }
}

window.onload = function () {
    var imgs = document.querySelectorAll('img[name=fb]');




         

     var ValorTotal = $("spam[for='nome']").attr('text');
     ValorTotal = ValorTotal.trim();
     ValorTotal = ValorTotal.replace(",", ".");

    console.log(ValorTotal);

    var eParcelas = $("#qtdParcelas");
    console.log(eParcelas);
    var parcelas = [];
    console.log(parcelas);

    if (ValorTotal < 300 && ValorTotal >= 100) {
        
        for (var i = 1; i <= 4; i++) {
            var option = $('<li>');
            var valorParcela = ValorTotal / i
            eParcelas.append(option.attr('value', i).append(`${i}x Parcelas de R$ ${valorParcela.toLocaleString()}`));

            parcelas.push({
                qtdParcelas: i,
                valor: valorParcela
            });
        }
    } else if (ValorTotal >= 300) {
    console.log("if do valor total" + ValorTotal);
        for (var i = 1; i <= 12; i++) {
            console.log("valor do i" + i);
            var option = $('<li>');
            var valorParcela = ValorTotal / i
            eParcelas.append(option.attr('value', i).append(`${i}x Parcelas de R$ ${valorParcela.toLocaleString()}`));
            parcelas.push({
                qtdParcelas: i,
                valor: valorParcela
            });
        }
    } else {
        for (var i = 1; i <= 1; i++) {
            var option = $('<li>');
            var valorParcela = ValorTotal / i
            eParcelas.append(option.attr('value', i).append(`${i}x Parcelas de R$ ${valorParcela.toLocaleString()}`));

            parcelas.push({
                qtdParcelas: i,
                valor: valorParcela
            });
        }
    }

    $(".formapagamentoDiv").hide();
    
    $(function () {
        $("#btnFormaPagamento").click(function () {
            $(".formapagamentoDiv").show();
        });
    });

    $(function () {
        $("#btnFormaPagamento").dblclick(function () {
            $(".formapagamentoDiv").hide();
        });
    });



}