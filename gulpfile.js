var gulp  = require('gulp'),
    jade  = require('gulp-jade'),
    prettify = require('gulp-prettify'),
    livereload  = require('gulp-livereload'),
    watch = require('gulp-watch')
    ;

    // Markup Tasks
  gulp.task('markup', function() {
    gulp.src('project/*.jade')
    .pipe(jade())
    .pipe(prettify({indent_size: 2}))
    .pipe(gulp.dest('build/'));
  });

    // Watch Task
    gulp.task('watch', function() {
      var server = livereload();
      gulp.watch('project/*.jade', ['markup']);
    });

    // Default task to be run with `gulp`
    gulp.task('default', ['markup','watch']);
