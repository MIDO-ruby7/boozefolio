var items = 30;//気泡の個数

for (var i=0; i<=items; i++) {
    var moveVal = Math.ceil( Math.random()*50 );
    var posVal = Math.ceil( Math.random()*50 );
    var scaleVal = Math.ceil( Math.random()*10 );
    var shakeVal = Math.ceil( Math.random()*5 );
    $(".box").append('<div class="move'+moveVal+' pos'+posVal+'"><div class="scale'+scaleVal+'"><div class="item shake'+shakeVal+'"></div></div>');
}

$(function() {
  var   bgsc1 = 0;
  var   bgsc2 = 0;
  var   bgsc3 = 0;
  var   bgsc4 = 0;
setInterval(function() {
  bgsc1 +=  0;
  bgsc2 += -2;
  bgsc3 += -5;
  bgsc4 += -7;
  $(".shake1").css("background-position", bgsc1 + "px " + bgsc2 + "px");
  $(".shake2").css("background-position", bgsc1 + "px " + bgsc3 + "px");
  $(".shake3").css("background-position", bgsc1 + "px " + bgsc4 + "px");
});
});