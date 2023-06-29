// インプットイベントが発生したときに処理を行うイベントリスナーを登録
document.addEventListener('DOMContentLoaded', function() {
  const numberInput = document.getElementById('item_alcohol_content');
  const incrementButton = document.querySelector('.range-increment');
  const decrementButton = document.querySelector('.range-decrement');

  // 増加ボタンのイベントリスナー
  incrementButton.addEventListener('click', function(e) {
    e.preventDefault(); // ボタンのデフォルト動作をキャンセル
    const step = parseFloat(numberInput.step);
    const currentValue = parseFloat(numberInput.value);
    const maxValue = parseFloat(numberInput.max);
    if (currentValue + step <= maxValue) {
      numberInput.value = (currentValue + step).toFixed(1);
      updateValueDisplay(numberInput);
    }
  });

  // 減少ボタンのイベントリスナー
  decrementButton.addEventListener('click', function(e) {
    // ボタンのデフォルト動作をキャンセル
    e.preventDefault();
    const step = parseFloat(numberInput.step);
    const currentValue = parseFloat(numberInput.value);
    const minValue = parseFloat(numberInput.min);
    if (currentValue - step >= minValue) {
      numberInput.value = (currentValue - step).toFixed(1);
      updateValueDisplay(numberInput);
    }
  });

  // // 吹き出しの更新
  // function updateValueDisplay(numberInput) {
  //   const valueDisplay = document.querySelector(numberInput.dataset.valueDisplay);
  //   if (valueDisplay) {
  //     valueDisplay.textContent = numberInput.value;
  //   }
  // }
});
