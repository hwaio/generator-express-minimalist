express = require 'express'
app = express()

app.use express.static(__dirname + '/app')
app.engine 'html', require('ejs').renderFile
app.set 'views', __dirname + '/app/views'

app.use require('connect-livereload')()

app.get '/', (req, res) ->
  res.render 'index.html'

server = app.listen 3000, () ->
  
  host = server.address().address
  port = server.address().port

  console.log 'app listening at http://%s:%s', host, port
