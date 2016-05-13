gulp  = require('gulp')
del   = require('del')
cache = require('gulp-cached')
path  = require('../paths.coffee')
gulp.task 'clean', ->
  cache.caches = {}
  del.sync path.to.destination
  return
