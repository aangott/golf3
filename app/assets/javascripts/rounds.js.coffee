$ ->

  Golf.SubstituteScoring =

    initialize: ->
      @initShowHideSubScoring()
      @addSubCheckboxListener()

    initShowHideSubScoring: ->
      $('.sub-used').each (idx, elem) =>
        @showHideSubScoring($(elem))

    addSubCheckboxListener: ->
      $('body').on 'change', '.sub-used', (evt) =>
        @showHideSubScoring($(evt.currentTarget))

    showHideSubScoring: ($ckbox) ->
      group = $ckbox.data('group')
      playerInputs = $(".#{group}_player")
      subInputs = $(".#{group}_sub")
      if $ckbox.prop('checked')
        playerInputs.val('').prop('disabled', true)
        subInputs.removeClass('hidden')
      else
        playerInputs.prop('disabled', false)
        subInputs.addClass('hidden')

  Golf.SubstituteScoring.initialize()
