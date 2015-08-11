Accounts.ui.config({
  passwordSignupFields: 'USERNAME_AND_EMAIL'
})

Template.messages.helpers
  messages: Messages.find()

# Template.footer.events
#   'keypress input': (e) ->
#     $input = $('.input-box_text')
#     inputVal = $input.val()
#
#     if !!inputVal
#       charCode = if (typeof e.which == "number") then e.which else e.keyCode
#       if charCode == 13
#         e.stopPropagation()
#         Messages.insert
#           text: inputVal
#           user: Meteor.userId()
#           timestamp: Date.now()
#
#         $input.val ''
#         false

Template.registerHelper "usernameFromId", (userId) ->
  user = Meteor.users.findOne(_id: userId)
  if (typeof user == 'undefined')
    return "Anonymous"
  if (typeof user.services.github != 'undefined')
    return user.services.github.username
  return user.username

Template.registerHelper 'timestampToTime', (timestamp) ->
  date = new Date(timestamp)
  hours = date.getHours()
  minutes = '0' + date.getMinutes()
  seconds = '0' + date.getSeconds()
  hours + ':' + minutes.substr(minutes.length - 2) + ':' + seconds.substr(seconds.length - 2)

Meteor.subscribe 'messages'
Meteor.subscribe('allUsernames')
