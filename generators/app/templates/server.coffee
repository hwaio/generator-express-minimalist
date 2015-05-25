express = require 'express'
passport = require 'passport'
app = express()

if process.env.ENV == 'dev'
  app.use require('connect-livereload')()

app.use express.static(__dirname + '/app')
app.engine 'html', require('ejs').renderFile
app.set 'views', __dirname + '/app/views'

app.use require('cookie-parser')()
app.use require('express-session')(
  secret: 'impressables',
  resave: false,
  saveUninitialized: true
)
app.use passport.initialize()
app.use passport.session()
require('./lib/passport')()
app.use require('./lib/router')()

port = process.env.PORT || 3000
server = app.listen port, () ->
  host = server.address().address
  port = server.address().port
  console.log 'app listening at http://%s:%s', host, port
