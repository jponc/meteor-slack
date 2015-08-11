Meteor.startup( ->
  Factory.define('message', Messages,
    text: -> Fake.sentence()
    user: Meteor.users.findOne()._id
    timestamp: Date.now()
    channel: 'general'
  )

  if Messages.find({}).count() == 0
    _(5).times( (n) ->
      Factory.create('message')
    )

  if Channels.find({}).count() == 0
    Channels.insert(name: 'general')
    Channels.insert(name: 'random')
)
