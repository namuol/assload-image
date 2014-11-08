tape = require 'tape'
loadImages = require '../index'

class ValidImage
Object.defineProperty ValidImage::, 'src',
  set: (val) ->
    setTimeout =>
      @onload()
    , 0

class InvalidImage
Object.defineProperty InvalidImage::, 'src',
  set: (val) ->
    setTimeout =>
      @onerror {}
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

    setTimeout =>
      t.true loadedImage?
      t.end()
    , 0

  it 'should call reject method on fail', (t) ->
    global.Image = InvalidImage
    errored = false
    loadImages() 'test', null, (error) ->
      errored = true

    setTimeout =>
      t.true errored
      t.end()
    , 0
