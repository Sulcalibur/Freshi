var gulp       = require('gulp'),
    jade       = require('gulp-jade'),
    prettify   = require('gulp-prettify'),
    sass       = require('gulp-sass'),
    uglify     = require('gulp-uglify'),
    livereload = require('gulp-livereload'),
    watch      = require('gulp-watch')
    ;

  // Markup Tasks
  gulp.task('markup', function() {
    gulp.src('project/*.jade')
    .pipe(jade())
    .pipe(prettify({indent_size: 2}))
    .pipe(gulp.dest('build/'));
  });

  // gulp.task('sass', function () {
  //   gulp.src('project/assets/*.scss')
  //   .pipe(sass())
  //   .pipe(gulp.dest('build/css'));
  // });

  // JavaScript Tasks
  gulp.task('scripts', function(){
    gulp.src('js/*.js')
    gulp.src('bower_components/modernizr/modernizr.js')
    //.pipe(plumber())
    .pipe(uglify())
    .pipe(gulp.dest('build/js/'))
  });


  // Styles Tasks
  gulp.task('styles', function() {
    gulp.src('project/assets/styles/*.scss')
    .pipe(sass({
      style: 'expanded'
    }))
    .pipe(gulp.dest('build/css/'))
  });


    // Watch Task
    gulp.task('watch', function() {
      var server = livereload();
      gulp.watch('project/*.jade', ['markup']);
      gulp.watch('project/assets/*.scss', ['styles']);
    });


    // Default task to be run with `gulp`
    gulp.task('default', ['markup','styles','watch']);
