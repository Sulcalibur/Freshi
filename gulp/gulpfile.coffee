gulp        = require 'gulp'
runSequence = require 'run-sequence'
requireDir  = require 'require-dir'

requireDir './tasks', recurse: true

gulp.task 'default', ->
  runSequence 'clean', [
    'pug'
    'stylus'
    'coffee'
    'images'
    # 'favicon'
  ], 'watch', 'browser-sync'
  return
