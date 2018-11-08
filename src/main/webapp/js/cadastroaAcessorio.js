window.onload = function() {

$(function() {
  var maxLength = '-0.000.000,00'.length;
  
  $("#inputPrecoA").maskMoney({
    allowNegative: true,
    thousands: '.',
    decimal: ',',
    affixesStay: false
  }).attr('maxlength', maxLength).trigger('mask.maskMoney');
});
  
}   