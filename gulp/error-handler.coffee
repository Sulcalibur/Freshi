gutil = require('gulp-util')
module.exports = handler: (error) ->
  console.log 'Error: ' + error
  gutil.beep()
  @emit 'end'
  return
