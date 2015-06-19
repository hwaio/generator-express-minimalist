var generators = require('yeoman-generator');
module.exports = generators.Base.extend({
  installDependencies: function() {
    this.npmInstall([
      'express',
      'jade'
    ]);
  },
  installDevDependencies: function() {
    this.npmInstall([
        'grunt',
        'grunt-contrib-watch',
        'grunt-contrib-coffee',
        'grunt-express-server',
        'grunt-newer',
        'grunt-contrib-stylus',
        'grunt-contrib-sass',
        'load-grunt-tasks',
        'connect-livereload'
    ], {'saveDev': true});
  },
  installBower: function() {
    this.bowerInstall([
    ])
  },
  copyPublicFiles: function () {
    this.fs.copy(
        this.templatePath('index.html'),
        this.destinationPath('app/views/index.html')
        );
    this.fs.write(this.destinationPath('app/css/main.styl'),'');
    this.fs.write(this.destinationPath('app/js/main.coffee'),'');
  },
  copyServerFiles: function () {
    this.fs.copy(
        this.templatePath('server.coffee'),
        this.destinationPath('server.coffee')
        );
    this.fs.copy(
        this.templatePath('Gruntfile.coffee'),
        this.destinationPath('Gruntfile.coffee')
        );
    this.fs.copy(
        this.templatePath('package.json'),
        this.destinationPath('package.json')
        );
    this.fs.copy(
        this.templatePath('bowerrc'),
        this.destinationPath('.bowerrc')
        );
    this.fs.copy(
        this.templatePath('gitignore'),
        this.destinationPath('.gitignore')
        );
  }
})
