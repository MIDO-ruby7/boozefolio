import "../add_jquery"

var items = 30; // 気泡の個数

// 気泡を生成して要素に追加
for (var i = 0; i <= items; i++) {
  var moveVal = Math.ceil(Math.random() * 50); // moveの値をランダムに生成
  var posVal = Math.ceil(Math.random() * 50); // posの値をランダムに生成
  var scaleVal = Math.ceil(Math.random() * 10); // scaleの値をランダムに生成
  var shakeVal = Math.ceil(Math.random() * 5); // shakeの値をランダムに生成
  $(".box").append(
    '<div class="move' +
      moveVal +
      ' pos' +
      posVal +
      '"><div class="scale' +
      scaleVal +
      '"><div class="item shake' +
      shakeVal +
      '"></div></div>'
  );
}

jQuery(function ($) {
  for (let i = 0; i <= 50; i++) {
    let time = i * 0.2; // アニメーションの時間を計算
    let scale = i * 0.1; // 要素のスケールを計算

    // shakeクラスの要素にアニメーションのスタイルを設定
    $('.shake' + i).css({
      animation: 'shake ' + (time + 2) + 's ease 0s infinite normal',
      '-webkit-animation': 'shake ' + (time + 2) + 's ease 0s infinite normal',
    });

    // moveクラスの要素にアニメーションのスタイルと位置を設定
    $('.move' + i).css({
      animation: 'move ' + (time + 5) + 's cubic-bezier(0.47, 0, 0.745, 0.715) ' + time + 's infinite normal',
      '-webkit-animation': 'move ' + (time + 5) + 's cubic-bezier(0.47, 0, 0.745, 0.715) ' + time + 's infinite normal',
      position: 'absolute',
      bottom: '-10%',
      left: (Math.random() * 100) + '%', // ランダムな左位置を設定
    });

    // posクラスの要素の左位置を調整
    $('.pos' + i).css({
      left: (i * 2) + '%',
    });

    // scaleクラスの要素のスケールを設定
    $('.scale' + i).css({
      transform: 'scale(' + scale + ')',
      '-webkit-transform': 'scale(' + scale + ')',
    });
  }
});
