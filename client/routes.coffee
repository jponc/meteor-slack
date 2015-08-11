Router.configure
  layoutTemplate: 'app'



Router.route('/', -> @redirect('/general'))
Router.route('/:channel', ->
  Session.set 'channel', @params.channel
  @render 'messages'
)
