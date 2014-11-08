# [assload](http://github.com/gitsubio/assload)-image [![Build Status](https://drone.io/github.com/gitsubio/assload-image/status.png)](https://drone.io/github.com/gitsubio/assload-image/latest) [![dependency Status](https://david-dm.org/gitsubio/assload-image/status.svg?style=flat-square)](https://david-dm.org/gitsubio/assload-image#info=dependencies) [![devDependency Status](https://david-dm.org/gitsubio/assload-image/dev-status.svg?style=flat-square)](https://david-dm.org/gitsubio/assload-image#info=devDependencies)

Browser-side image loader for Assload.

**NOTE:** This is experimental software; use at your own risk. (And please [report issues](http://github.com/gitsubio/assload-image/issues))

```js
var assload = require('assload'),
    loadImages = require('assload-image');

assload.use({
  images: loadImages()
});

assload.bundle({
  images: {
    doge: 'doge.jpg',
    external: 'http://example.com/image.png'
  }
}).load().then(function () {
  console.log('Finished loading images');
}, function (err) {
  console.error(err.message);
  console.error('Error event', err.event);
  console.error('Image that failed', err.image);
});
```

## License

MIT

## Install

```bash
npm install assload-image --save
```

----

[![Analytics](https://ga-beacon.appspot.com/UA-33247419-2/assload/README.md)](https://github.com/igrigorik/ga-beacon)
