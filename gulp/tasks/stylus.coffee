gulp         = require('gulp')
stylus       = require('gulp-stylus')
postcss      = require('gulp-postcss')
nib          = require('nib')
typographic  = require('typographic')
rupture      = require('rupture')
lost         = require('lost-stylus')
autoprefixer = require('autoprefixer')
sourcemaps   = require('gulp-sourcemaps')
browserSync  = require('browser-sync').create()

gulp.task 'stylus', ->
  gulp.src('assets/stylus/main.styl')
  .pipe(sourcemaps.init())
  .pipe(stylus(
    'include css': true
    use: [
      nib(),
      typographic(),
      rupture()
  ]))
  .pipe(postcss([
    require('lost')
  ]))
  .pipe gulp.dest('build/css/')
  .pipe browserSync.stream()
  .pipe(sourcemaps.write())
return


#
# gulp.src('./app/styl/style.styl')
#   .pipe(stylus('include css': true)).pipe gulp.dest('./dist/css')
