gulp = require('gulp')
path = require('../paths.coffee')
gulp.task 'watch', ->
  gulp.watch '*.pug', [ 'pug' ]
  gulp.watch 'assets/stylus/*.styl', [ 'stylus' ]
  gulp.watch 'assets/coffee/*.coffee', [ 'coffee' ]
  gulp.watch 'assets/images/**/*.*', [ 'images' ]
  return
