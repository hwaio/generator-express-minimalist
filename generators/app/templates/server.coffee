express = require 'express'
app = express()

if process.env.ENV == 'dev'
  app.use require('connect-livereload')()

app.use express.static(__dirname + '/app')
app.engine 'html', require('jade').__express
app.set 'views', __dirname + '/app/views'

router = express.Router()
router.get '/', (req, res) ->
  res.render 'index.html'
router.get '*', (req, res) ->
  res.send 404
app.use router

port = process.env.PORT || 3000
server = app.listen port, () ->
  host = server.address().address
  port = server.address().port
  console.log 'app listening at http://%s:%s', host, port
