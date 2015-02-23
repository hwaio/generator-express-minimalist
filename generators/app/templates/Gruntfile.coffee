module.exports = (grunt) ->

  require('load-grunt-tasks') grunt

  grunt.initConfig

    express:
      options:
        port: process.env.PORT || 3000
      app:
        options:
          script: 'server.js'

    coffee:
      server:
        files:
          'server.js': 'server.coffee'
      lib:
        files: [
          expand: true
          cwd: 'lib'
          src: '**/*.coffee'
          dest: 'lib'
          ext: '.js'
        ]
      js:
        files: [
          expand: true
          cwd: 'app/js'
          src: '**/*.coffee'
          dest: 'app/js'
          ext: '.js'
        ]

    stylus:
      css:
        files: [
          expand: true
          cwd: 'app/css'
          src: '**/*.styl'
          dest: 'app/css'
          ext: '.css'
        ]

    watch:
      serverCoffee:
        files: ['server.coffee']
        tasks: ['newer:coffee:server']
      libCoffee:
        files: ['lib/**/*.coffee']
        tasks: ['newer:coffee:lib']
      jsCoffee:
        files: ['app/js/**/*.coffee']
        tasks: ['newer:coffee:js']
      cssStylus:
        files: ['app/css/**/*.styl']
        tasks: ['newer:stylus:css']
      livereload:
        files: [
          'app/**/*'
        ],
        options:
          livereload: true
      express:
        files: [
          'server.js'
          'lib/**/*.js'
        ]
        tasks: ['express:app']
        options:
          livereload: true
          spawn: false

  grunt.registerTask 'coffees', [
    'coffee:server'
    'coffee:lib'
    'coffee:js'
  ]

  grunt.registerTask 'default', [
    'coffees'
    'stylus:css'
    'express:app'
    'watch'
  ]
