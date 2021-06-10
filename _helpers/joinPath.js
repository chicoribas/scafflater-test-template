const path = require('path')

module.exports = (...paths) => {
  // Remove options parame
  paths.pop()
  return path.join(...paths)
}
