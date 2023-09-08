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

  Quagga.onDetected(result=>{
    console.log(result.codeResult.code);
    $("#my_result").text(result.codeResult.code);
  });
};