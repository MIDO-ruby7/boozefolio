console.log("quagga.js loaded!!");

window.onload = function(){
  Quagga.init({
    inputStream: {
      type: "LiveStream",
      target: document.querySelector('#my_quagga')
    },
    constraints: {
      facingMode: "environment",
    },
    decoder: {
      readers: [ "ean_reader" ]
    }
  },
  function(err) {
    if (err) {
      console.log(err);
      return;
    }
    console.log("Initialization finished. Ready to start");
    Quagga.start();
  });

  Quagga.onProcessed(result=>{
    if(result == null) return;// 未検出の場合
    if(typeof(result) != "object") return;
    if(result.boxes == undefined) return;
    const ctx = Quagga.canvas.ctx.overlay;
    const canvas = Quagga.canvas.dom.overlay;
    ctx.clearRect(0, 0, parseInt(canvas.width), parseInt(canvas.height));
    Quagga.ImageDebug.drawPath(result.box,
      {x: 0, y: 1}, ctx, {color: "blue", lineWidth: 5});// 結果を描画
  });

  let lastRequestTime = 0;
  const requestInterval = 2000;

  Quagga.onDetected(result => {
    const currentTime = Date.now();
    if (currentTime - lastRequestTime >= requestInterval) {
      const barcodeValue = result.codeResult.code;
      console.log(barcodeValue);
      $("#my_result").text(barcodeValue);

      $.ajax({
        type: "GET",
        url: "/items/barcode_search",
        data: { barcode: barcodeValue },
        success: function(response) {
          console.log("バーコード値がサーバーに送信されました");
          renderItems(response.hits);
        },
        error: function(error) {
          console.error("バーコード値の送信中にエラーが発生しました");
        }
      });
      lastRequestTime = currentTime; // 最後のリクエスト時刻を更新
    }
  });
};

function renderItems(data) {
  console.log(data);
  $('#jan_codo_suggested-items').empty(); // 既存の内容をクリア

  // JSON データ内の各アイテムに対して処理を行う
  data.forEach(item => {
    const itemLink = document.createElement('a');
    itemLink.textContent = item.name;
    itemLink.href = `/items/new?name=${encodeURIComponent(item.name)}&maker=${encodeURIComponent(item.parentBrandName)}&janCode=${encodeURIComponent(item.janCode)}`;

    $('#jan_codo_suggested-items').append(itemLink); // リンクを div に追加
  });
}