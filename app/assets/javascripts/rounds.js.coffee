$ ->
  $(window).load ->
    $('body').on 'change', '.sub-used', (evt) ->
      $ckbox = $(evt.currentTarget)
      group = $ckbox.data('group')
      playerInputs = $(".#{group}_player")
      subInputs = $(".#{group}_sub")
      console.log playerInputs
      if $ckbox.prop('checked')
        playerInputs.val('').prop('disabled', true)
        subInputs.removeClass('hidden')
      else
        playerInputs.val('').prop('disabled', false)
        subInputs.addClass('hidden')