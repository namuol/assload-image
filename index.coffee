loadImages = ->
  return (path, resolve, reject, notify) ->
    img = new Image
    
    img.onload = ->
      resolve img
      return

    img.onerror = (evt) ->
      err = new Error 'Image failed to load. See the attached "event" and "image" attributes for details.'
      err.event = evt
      err.image = img
      reject err
      return
    
    img.src = path

module.exports = loadImages
