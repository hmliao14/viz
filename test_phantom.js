var page = require('webpage').create();
page.open('https://google.com/', function() {
  page.render('google.png');
  phantom.exit();
});
