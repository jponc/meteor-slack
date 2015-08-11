Meteor.publish 'messages', ->
  Messages.find()

Meteor.publish 'allUsernames', ->
  Meteor.users.find({}, {fileds: {
    'usernme': 1,
    'services.github.username': 1
  }})
