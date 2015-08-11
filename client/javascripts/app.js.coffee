Template.messages.helpers
  messages: Messages.find()

Template.footer.events
  'keypress input': (e) ->
    $input = $('.input-box_text')
    inputVal = $input.val()

    if !!inputVal
      charCode = if (typeof e.which == "number") then e.which else e.keyCode
      if charCode == 13
        e.stopPropagation()
        Messages.insert(text: inputVal)
        $input.val ''
        false
