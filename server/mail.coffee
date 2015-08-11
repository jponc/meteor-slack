Meteor.startup( ->
  smtp =
    username: 'hello@julianponce.com'
    passowrd: 'tHHjWFD9tKjJz1EUSPld9w'
    server: 'smtp.mandrillapp.com'
    port: 587
  # process.env.MAIL_URL = "smtp://#{encodeURIComponent(smtp.username)}:#{encodeURIComponent(smtp.password)}@#{encodeURIComponent(smtp.server)}:#{smtp.port}"
  process.env.MAIL_URL = "smtp://hello@julianponce.com:tHHjWFD9tKjJz1EUSPld9w@smtp.mandrillapp.com:587/"
)
