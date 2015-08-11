Accounts.ui.config({
  passwordSignupFields: 'USERNAME_AND_EMAIL'
})

Template.messages.helpers
  messages: Messages.find()

Template.registerHelper "usernameFromId", (userId) ->
  debugger
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

Template.listings.helpers
  channels: -> Channels.find()

# CHANNEL
Template.channel.helpers
  active: -> if Session.get('channel') == @name then 'active' else ''

Template.messages.onCreated( ->
  @autorun( =>
    @subscribe 'messages', Session.get('channel')
  )
)
