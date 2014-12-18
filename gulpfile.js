var gulp        = require('gulp'),
    jade        = require('gulp-jade'),
    prettify    = require('gulp-prettify'),
    sass        = require('gulp-sass'),
    minifyCSS   = require('gulp-minify-css'),
    uglify      = require('gulp-uglify'),
    browserSync = require('browser-sync')
    // livereload  = require('gulp-livereload'),
    watch       = require('gulp-watch')
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
      style: 'compress'
    }))
    // .pipe(uglify())
    .pipe(minifyCSS({keepBreaks:true}))
    .pipe(gulp.dest('build/css/'))
    // .pipe(gulp.dest('build/css/'))
  });

  gulp.task('browser-sync', function () {
    var files = [
    'build/**/*.html',
    'build/css/**/*.css',
    'build/img/**/*.svg',
    'build/img/**/*.jpg',
    'build/img/**/*.gif',
    'build/img/**/*.png',
    'build/js/**/*.js'
    ];

    browserSync.init(files, {
      server: {
        baseDir: './build'
      }
    });
  });

  // Watch Task
  gulp.task('watch', function() {
    gulp.watch('project/**/*.jade', ['markup']);
    gulp.watch('project/assets/styles/**/*.scss', ['styles']);
  });

  // Default task to be run with `gulp`
  gulp.task('default', ['markup','styles','watch','browser-sync']);
