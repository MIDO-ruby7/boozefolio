console.log('yahoo_api.js loaded');

document.addEventListener('DOMContentLoaded', function () {
  const itemNameInput = document.querySelector('#item_name');
  const suggestedItems = document.querySelector('#suggested-items');

  itemNameInput.addEventListener('input', function () {
    const query = itemNameInput.value;

    // APIにクエリを送信して候補商品名を取得
    fetch(`/items/search?query=${query}`)
      .then(response => response.json())
      .then(data => {
        // 候補商品名を表示するUI要素をクリア
        suggestedItems.innerHTML = '';

        if (data && data.hits) {
          // 取得した候補商品名をUIに表示
          data.hits.forEach(item => {
            console.log(item);
            const itemLink = document.createElement('a');
            itemLink.textContent = item.name; // nameを表示
            itemLink.href = '#'; // 商品名を選択した場合の処理を追加

            // 商品名をクリックしたらテキストフィールドに自動入力
            itemLink.addEventListener('click', function () {
              itemNameInput.value = item.name; // 商品名をテキストフィールドにセット
              suggestedItems.innerHTML = ''; // 選択後、候補をクリア
            });

            suggestedItems.appendChild(itemLink);
          });
        } else {
          // データが空の場合の処理を追加（候補商品が見つからない場合など）
          const noItemsMessage = document.createElement('p');
          noItemsMessage.textContent = 'No items found.';
          suggestedItems.appendChild(noItemsMessage);
        }
      })
      .catch(error => {
        console.error('API request failed:', error);
      });
  });
});
