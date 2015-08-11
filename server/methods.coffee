Meteor.methods
  newMessage: (message) ->
    message.timestamp = Date.now()
    message.user = Meteor.userId()
    Messages.insert(message)
