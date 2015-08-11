Meteor.publish 'messages', (channel) ->
  Messages.find(channel: channel)

Meteor.publish 'allUsernames', ->
  Meteor.users.find({}, {fileds: {
    'usernme': 1,
    'services.github.username': 1
  }})

Meteor.publish 'channels', -> Channels.find()
