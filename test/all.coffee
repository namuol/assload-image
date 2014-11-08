tape = require 'tape'
loadImages = require '../index'

class ValidImage
Object.defineProperty ValidImage::, 'src',
  get: -> @__src
  set: (val) ->
    @__src = val
    setTimeout =>
      @onload?()
    , 0

class InvalidImage
Object.defineProperty InvalidImage::, 'src',
  get: -> @__src
  set: (val) ->
    @__src = val
    setTimeout =>
      @onerror?({})
    , 0

describe = (item, cb) ->
  it = (capability, test) ->
    tape.test item + ' ' + capability, (t) ->
      test(t)

  cb it

describe 'assload-image', (it) ->
  it 'should call resolve method on success', (t) ->
    global.Image = ValidImage
    loadedImage = null
    loadImages() 'test', (image) ->
      loadedImage = image
    , (error) ->
      t.fail 'didnt expect error to occur'

    setTimeout =>
      t.true loadedImage?
      t.end()
    , 0

  it 'should call reject method on fail', (t) ->
    global.Image = InvalidImage
    errored = false
    loadImages() 'test', (image) ->
      t.fail 'didnt expect to successfully load!'
    , (error) ->
      errored = true

    setTimeout =>
      t.true errored
      t.end()
    , 0
