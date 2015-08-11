Meteor.startup( ->
  if Channels.find({}).count() == 0
    Channels.insert(name: 'general')
    Channels.insert(name: 'random')
)
