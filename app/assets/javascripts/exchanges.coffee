$(document).ready ->
  $('input[type=number]').on 'keyup change', ->
    $('form').submit ->
    console.log("teste")
    # if $('form').attr('action') == '/convert'
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
  