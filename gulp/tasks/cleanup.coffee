gulp     = require('gulp')
uncss    = require('gulp-uncss')
# nano     = require('gulp-cssnano')
checkCSS = require( 'gulp-check-unused-css' )

gulp.task 'clean-check', ->
  gulp.src('build/css/*.css')
  .pipe(checkCSS())


gulp.task 'clean-css', ->
  gulp.src('build/css/*.css')
  .pipe(uncss(
    html: ['/build/*.html']))
  # .pipe(nano())
  .pipe gulp.dest('build/css/')
