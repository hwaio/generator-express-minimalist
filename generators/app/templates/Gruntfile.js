module.exports = (grunt) => {
  require('load-grunt-tasks')(grunt)

  grunt.initConfig({
    express: {
      app: {
        options: {
          script: 'app.js'
        }
      }
    },
    watch: {
      livereload: {
        files: ['app/**/*'],
        options: {
          livereload: true
        }
      },
      express: {
        files: ['app.js', 'lib/**/*.js'],
        tasks: ['express:app'],
        options: {
          livereload: true,
          spawn: false
        }
      }
    }
  });
  return grunt.registerTask('default', ['express:app', 'watch'])
};
