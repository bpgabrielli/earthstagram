$(function() {
  $('.earthstagram').first().addClass('active');
});

function swapImages(){
  var $active = $('#earthstagrams .active');
  var $next = ($('#earthstagrams .active').next().length > 0) ? $('#earthstagrams .active').next() : $('#earthstagrams img:first');
  $active.fadeOut(function(){
    $active.removeClass('active');
    $next.fadeIn().addClass('active');
  });
}

$(function() {
  setInterval('swapImages()', 6000);
});

$(function() {
  setInterval('location.reload()', 300000);
});

$(function() {
var starsNumber = 100;
//number of stars

var c = document.getElementById('c');
var ctx = c.getContext('2d');

var w = window.innerWidth;
var h = window.innerHeight;
var x = 100; var y = 100;

//where the stars are stored
var stars = [];
for(i = 0; i < starsNumber; i++) {
  //making 100 stars
  stars.push(new star);
};

function star() {
  //the obj star function
  this.x = Math.random() * w;
  this.y = Math.random() * h;
  //random position
  
  this.vx = 1;
  //starting velocity
  
  this.r = Math.random() * 3 + 1;
  //random size
}

//the reset
function draw() {
  c.width = w;
  c.height = h;
  //canvas width & height
  
  for(t = 0; t < stars.length; t++) {
    var s = stars[t];
    
    //building the stars
    ctx.beginPath();
    ctx.fillStyle = 'lightgray';
    ctx.arc(s.x, s.y, s.r, Math.PI * 2, false);
    ctx.fill();
    
    //animating the stars
    s.x-=s.vx;
    
    //keeping the stars on the canvas
    if(s.x < -s.r) {
      s.x = w + s.r;
    };
    if(s.r < 5) {
      s.vx = 1;
    };
    if(s.r < 4) {
      s.vx = 0.5;
    };
    if(s.r < 3) {
      s.vx = 0.25;
    };
  }
}

setInterval(draw, 20);
});