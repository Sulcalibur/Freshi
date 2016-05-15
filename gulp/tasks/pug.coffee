gulp        = require('gulp')
browserSync = require('browser-sync')
pug         = require('gulp-pug')
evilIcons   = require('gulp-evil-icons')
path        = require('../paths.coffee')
error       = require('../error-handler.coffee')

gulp.task 'pug', ->
  gulp.src('*.pug').pipe(pug({
    pretty: true
    }))
    .pipe(evilIcons())
    .pipe(gulp.dest('build/'))
