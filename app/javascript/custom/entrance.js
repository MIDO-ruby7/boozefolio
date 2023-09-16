console.log("entrance.js loaded");

document.getElementById("changeBackgroundButton").addEventListener("click", function() {
  const hero = document.querySelector(".hero");
  hero.style.backgroundImage = 'url(https://boozepedia.s3.ap-northeast-3.amazonaws.com/material/utyuu.jpg)';

  // テキストの変更を時間差で実行
  setTimeout(function() {
    const textElement = document.querySelector(".replacementContent");
    textElement.innerHTML = `
      <p class="text-slate-200 text-xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-slate-300 fade-in">それでもいい。きみは森で、私はBOOZEKUZUで暮らそう。<br/>ともに生きよう。会いにいくよ</p>
    `;

    // 削除する部分を見つけてinnerHTMLを空にする
    const textElementDelete = document.querySelector(".dele-element");
    textElementDelete.innerHTML = '';
  }, 1000); // 1000ミリ秒（1秒）後に実行
});
