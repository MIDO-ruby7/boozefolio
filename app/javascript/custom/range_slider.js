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

document.addEventListener('DOMContentLoaded', function() {
  const rangeSliderInput = document.querySelector('.range-slider-input');
  const rangeSlider = rangeSliderInput.querySelector('input[type="range"]');
  const incrementButton = rangeSliderInput.querySelector('.range-increment');
  const decrementButton = rangeSliderInput.querySelector('.range-decrement');

  // 増加ボタンのイベントリスナー
  incrementButton.addEventListener('click', function(e) {
    e.preventDefault(); // ボタンのデフォルト動作をキャンセル
    const step = parseFloat(rangeSlider.step);
    const currentValue = parseFloat(rangeSlider.value);
    const maxValue = parseFloat(rangeSlider.max);
    if (currentValue + step <= maxValue) {
      rangeSlider.value = (currentValue + step).toFixed(1);
      updateValueDisplay(rangeSlider);
    }
  });

  // 減少ボタンのイベントリスナー
  decrementButton.addEventListener('click', function(e) {
    // ボタンのデフォルト動作をキャンセル
    e.preventDefault();
    const step = parseFloat(rangeSlider.step);
    const currentValue = parseFloat(rangeSlider.value);
    const minValue = parseFloat(rangeSlider.min);
    if (currentValue - step >= minValue) {
      rangeSlider.value = (currentValue - step).toFixed(1);
      updateValueDisplay(rangeSlider);
    }
  });

  // 吹き出しの更新
  function updateValueDisplay(rangeSlider) {
    const valueDisplay = document.querySelector(rangeSlider.dataset.valueDisplay);
    if (valueDisplay) {
      valueDisplay.textContent = rangeSlider.value;
    }
  }
});
