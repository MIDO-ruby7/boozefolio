import "../add_jquery"

var items = 100; // 気泡の個数

// 気泡を生成して要素に追加
for (var i = 0; i <= items; i++) {
  var moveVal = Math.ceil(Math.random() * 50); // moveの値をランダムに生成
  var posVal = Math.ceil(Math.random() * 50); // posの値をランダムに生成
  var scaleVal = Math.ceil(Math.random() * 10); // scaleの値をランダムに生成
  var shakeVal = Math.ceil(Math.random() * 5); // shakeの値をランダムに生成
  $(".boxNew").append(
    '<div class="moveNew' +
      moveVal +
      ' pos' +
      posVal +
      '"><div class="scale' +
      scaleVal +
      '"><div class="item shakeNew' +
      shakeVal +
      '"></div></div>'
  );
}

jQuery(function ($) {
  for (let i = 0; i <= 50; i++) {
    let time = i * 0.2; // アニメーションの時間を計算
    let scale = i * 0.1; // 要素のスケールを計算

    // shakeクラスの要素にアニメーションのスタイルを設定
    $('.shakeNew' + i).css({
      animation: 'shakeNew ' + (time + 0.2) + 's ease 0s infinite normal',
      '-webkit-animation': 'shakeNew ' + (time + 0.2) + 's ease 0s infinite normal',
    });

    // moveクラスの要素にアニメーションのスタイルと位置を設定
    $('.moveNew' + i).css({
      animation: 'moveNew ' + (time + 0.5) + 's cubic-bezier(0.47, 0, 0.745, 0.715) ' + time + 's infinite normal',
      '-webkit-animation': 'moveNew ' + (time + 0.5) + 's cubic-bezier(0.47, 0, 0.745, 0.715) ' + time + 's infinite normal',
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