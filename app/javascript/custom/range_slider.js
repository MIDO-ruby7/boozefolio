// インプットイベントが発生したときに処理を行うイベントリスナーを登録
document.addEventListener('input', function(event) {
  // イベントが発生した要素が、data-value-display属性を持っているかをチェック
  if (event.target.matches('[data-value-display]')) {
    // イベントが発生した要素から、data-value-display属性の値を取得し、吹き出し要素を取得
    const valueDisplay = document.querySelector(event.target.dataset.valueDisplay);
    // 吹き出し要素が存在する場合のみ、選択された値を吹き出しに表示
    if (valueDisplay) {
      valueDisplay.textContent = event.target.value;
    }
  }
});