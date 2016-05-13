# File globs.
path = require('path')
pathToThisFile = __dirname
root = path.dirname(pathToThisFile)
destination = root + '/build/'
module.exports = to:
  destination: destination
  pug:
    source: root + '*.pug'
    pages: root + '*.pug'
    destination: destination
  styles:
    source: root + '/assets/stylus/*.styl'
    main: root + '/assets/stylus/main.styl'
    destination: destination
  scripts:
    source: root + '/assets/coffee/**/*.js'
    main: root + '/assets/coffee/main.js'
    destination: destination + 'assets/scripts/'
  images:
    source: root + '/assets/images/**/*.*'
    destination: destination + 'assets/images/'
  favicon:
    source: root + '/assets/images/favicon.png'
    destination: destination
