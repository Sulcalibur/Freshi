gulp         = require('gulp')
stylus       = require('gulp-stylus')
nib          = require('nib')
typographic  = require('typographic')
rupture      = require('rupture')
csswring     = require('csswring')
uncss        = require('gulp-uncss')
lost         = require('lost-stylus')
rucksack     = require('rucksack-css')
autoprefixer = require('autoprefixer')
sourcemaps   = require('gulp-sourcemaps')
postcss      = require('gulp-postcss')
browserSync  = require('browser-sync').create()

processors = [
  lost,
  rucksack,
  autoprefixer
]

gulp.task 'stylus', ->
  gulp.src('assets/stylus/main.styl')
  .pipe(sourcemaps.init())
  .pipe(stylus(
    'include css': true
    use: [
      nib(),
      typographic(),
      rupture(),
  ]))
  .pipe(postcss(processors))
  .pipe(uncss(html: [
    'build/index.html'
    'build/**/*.html'
  ]))
  .pipe gulp.dest('build/css/')
  .pipe browserSync.stream()
  .pipe(sourcemaps.write())
return


gulp.task 'cleaning', ->
  gulp.src('build/css/main.css').pipe(uncss(html: [
    'build/index.html'
    'build/posts/**/*.html'
  ])).pipe gulp.dest('build/css/out/')
