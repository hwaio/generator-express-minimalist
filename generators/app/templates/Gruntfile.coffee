module.exports = (grunt) ->

  require('load-grunt-tasks') grunt

  grunt.initConfig

    express:
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

    sass:
      css:
        files: [
          expand: true,
          cwd: 'app/css'
          src: '**/*.sass'
          dest: 'app/css'
          ext: '.css'
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
      cssSass:
        files: ['app/css/**/*.sass']
        tasks: ['newer:sass:css']
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
    'sass:css'
    'stylus:css'
    'express:app'
    'watch'
  ]

