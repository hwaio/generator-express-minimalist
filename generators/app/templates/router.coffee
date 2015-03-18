module.exports = (router) ->
  router.get '/', (req, res) ->
    res.render 'index.html'
  router.get '*', (req, res) ->
    res.send 404

  return router

