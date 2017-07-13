var Generator = require('yeoman-generator')
module.exports = class extends Generator {
  constructor(args, opts) {
    super(args, opts)
  }

  installing() {
    this.npmInstall([
      'express',
      'ejs'
    ])
    this.npmInstall([
        'grunt',
        'grunt-contrib-watch',
        'grunt-express-server',
        'grunt-newer',
        'load-grunt-tasks',
        'connect-livereload'
    ], {'saveDev': true});
  }

  writing() {
    this.fs.copy(
        this.templatePath('index.html'),
        this.destinationPath('app/views/index.html')
        );
    this.fs.copy(
        this.templatePath('app.js'),
        this.destinationPath('app.js')
        );
    this.fs.copy(
        this.templatePath('Gruntfile.js'),
        this.destinationPath('Gruntfile.js')
        );
    this.fs.copy(
        this.templatePath('package.json'),
        this.destinationPath('package.json')
        );
    this.fs.copy(
        this.templatePath('gitignore'),
        this.destinationPath('.gitignore')
        );
    this.fs.copy(
        this.templatePath('bowerrc'),
        this.destinationPath('.bowerrc')
        );
    this.fs.write(this.destinationPath('app/css/main.css'),'');
    this.fs.write(this.destinationPath('app/js/main.js'),'');
  }
}
