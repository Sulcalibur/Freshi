gulp        = require('gulp')
browserSync = require('browser-sync').create()
path        = require('../paths.coffee')

# Static server
gulp.task 'browser-sync', ->
  browserSync.init server: baseDir: 'build/'
  # gulp.watch 'assets/stylus/*.styl', [ 'stylus' ]
  # gulp.watch 'build/css/main.css'.on('change', browserSync.reload)
  gulp.watch('build/**/*') .on('change', browserSync.reload)
  return

# Static Server + watching stylus/pug files
gulp.task 'serve', [ 'stylus' ], ->
  browserSync.init server: 'build/'
  gulp.watch 'assets/stylus/*.styl', [ 'stylus' ]
  gulp.watch('build/*.html').on 'change', browserSync.reload
  return
