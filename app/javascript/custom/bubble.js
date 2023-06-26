var items = 30;//気泡の個数

for (var i=0; i<=items; i++) {
  var moveVal = Math.ceil( Math.random()*50 );
  var posVal = Math.ceil( Math.random()*50 );
  var scaleVal = Math.ceil( Math.random()*10 );
  var shakeVal = Math.ceil( Math.random()*5 );
  $(".box").append('<div class="move'+moveVal+' pos'+posVal+'"><div class="scale'+scaleVal+'"><div class="item shake'+shakeVal+'"></div></div>');
}
