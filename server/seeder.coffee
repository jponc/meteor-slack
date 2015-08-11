Meteor.startup( ->
  Factory.define('message', Messages,
    text: -> Fake.sentence()
    timestamp: -> Date.now()
  )

  Messages.remove({})

  if Messages.find({}).count() == 0
    _(5).times( (n) ->
      Factory.create('message')
    )
)
