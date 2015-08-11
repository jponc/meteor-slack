Template.footer.events 'keypress input': (e) ->
  inputVal = $('.input-box_text').val()
  if !!inputVal
    charCode = if typeof e.which == 'number' then e.which else e.keyCode
    if charCode == 13
      e.stopPropagation()
      Meteor.call 'newMessage', text: $('.input-box_text').val()
      $('.input-box_text').val ''
      return false
  return
