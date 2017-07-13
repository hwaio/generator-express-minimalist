let express = require('express')
let app = express()
let router = express.Router()

if (process.env.ENV === 'dev') {
  app.use(require('connect-livereload')())
}
app.use(express.static(__dirname + '/app'))
app.engine('html', require('ejs').renderFile)
app.set('views', __dirname + '/app/views')

router.get('/', (req, res) => {
  return res.render('index.html')
})
router.get('*', (req, res) => {
  return res.sendStatus(404)
})

app.use(router)

let port = process.env.PORT || 3000;
let server = app.listen(port, () => {
  var host = server.address().address;
  return console.log('app listening at http://%s:%s', host, port);
})

