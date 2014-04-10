$ ->
  $('#ajax_link').on "click", (e) ->
    $.ajax
      type: 'GET'
      url: 'api/users/1'
      success: (data, textStatus, jqXHR) ->
        $("#ajax_link").addClass('user')
        $("#user").html(data.email)

      e.preventDefault()