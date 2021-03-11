$(document).ready ->
  
  $('#invert').click ->
    source = $("#target_currency").val()
    target = $("#source_currency").val()
    $("#source_currency").val(source)
    $("#target_currency").val(target)

  $('#amount, #source_currency, #target_currency, #invert').on 'keyup change click', ->#
    $('form').submit ->
    $.ajax '/convert',
          type: 'GET'
          dataType: 'json'
          data: {
          source_currency: $("#source_currency").val(),
          target_currency: $("#target_currency").val(),
          amount: $("#amount").val()
            }
          error: (jqXHR, textStatus, errorThrown) ->
            alert textStatus
          success: (data, text, jqXHR) ->
            $('#result').val(data.value)
        return false
  



  