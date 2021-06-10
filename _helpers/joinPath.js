const path = require('path')

module.exports = (...paths) => {
  return path.join(...paths)
}
