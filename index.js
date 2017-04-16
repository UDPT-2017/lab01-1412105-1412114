var express = require('express');
var exphbs  = require('express-handlebars');

var app = express();


app.use(express.static('public'));
app.use(express.static('bower_components'));


// can tim hieu dong code nay
app.engine('hbs', exphbs({
  extname: '.hbs'
}));
app.set('view engine', 'hbs');
app.get('/hbs', function(req, res){
  var img = [
    'img/4.jpg',
    'img/5.jpg',
    'img/6.jpg',
  ];
  var mes = [
    'Best saler',
    'Best viewer',
    'Best Rated',
  ];
  res.render('index',
  {
    title :'Home',
    images: img,
    layout: 'template'
  })
});
app.get('/album', function(req, res){
  var img = [
    'img/1.jpg',
    'img/2.jpg',
    'img/3.jpg',
    'img/4.jpg',
    'img/5.jpg',
    'img/6.jpg',
  ];
  res.render('album',{
    title :'Album',
    images: img,
    layout: 'template'
  })
});
app.get('/blog', function(req, res){
  res.render('blog',{
    title :'Blog',
    layout: 'template'
  })
});
app.get('/about', function(req, res){
  res.render('about',{
    title :'About',
    layout: 'template'
  })
});
app.get('/photos', function(req, res){
  var img = [
    'img/1.jpg',
    'img/2.jpg',
    'img/3.jpg',
    'img/4.jpg',
    'img/5.jpg',
    'img/6.jpg',
  ];
  res.render('photos',{
    title :'Photos',
    images: img,
    layout: 'template'
  })
});
app.get('/photos', function(req, res){
  var img = [
    'img/1.jpg',
    'img/2.jpg',
    'img/3.jpg',
    'img/4.jpg',
    'img/5.jpg',
    'img/6.jpg',
  ];
  res.render('photos',{ title :'Photos', images: img})
});





var port = 3000;
app.listen(port, function () {
  console.log(`Example app listening on port ${port}!`);
});
