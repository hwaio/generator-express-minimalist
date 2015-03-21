passport = require 'passport'
FacebookStrategy = require('passport-facebook').Strategy

module.exports = () ->
  passport.use(new FacebookStrategy({
      clientID: "",
      clientSecret: "",
      callbackURL: "",
    }, (accessToken, refreshToken, profile, done) ->
      
  ))
