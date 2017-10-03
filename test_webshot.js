var webshot = require('webshot');
webshot('https://www.google.com/', 'google2.jpeg', {captureSelector: "#hplogo"}, function(err) {
// screenshot now saved to flickr.jpeg
});
