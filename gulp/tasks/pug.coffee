gulp         = require('gulp')
browserSync  = require('browser-sync')
pug          = require('gulp-pug')
path = require('../paths.coffee')
error = require('../error-handler.coffee')

gulp.task 'pug', ->
  gulp.src('*.pug').pipe(pug({
    pretty: true
    })).pipe(gulp.dest('build/'))
