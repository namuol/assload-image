loadImages = ->
  return (path, resolve, reject, notify) ->
    img = new Image
    img.onload = -> resolve img
    img.onerror = (e) -> reject e
    img.src = path

module.exports = loadImages
