console.log('yahoo_api.js loaded');

document.addEventListener('DOMContentLoaded', function () {
  const itemNameInput = document.querySelector('#item_name');
  const suggestedItems = document.querySelector('#suggested-items');
  let timeoutId;

  const categoryElement = document.querySelector('#category-id');
  const category_id = categoryElement.dataset.categoryId;
  console.log(category_id);

  let categoryIdToUse = category_id; // 初期値を設定

  // category_idの値を取得
  const categorySelect = document.querySelector('#item_category_id');
  function handleCategoryChange() {
    const selectedCategoryId = categorySelect.value;
    console.log(selectedCategoryId);

    categoryIdToUse = selectedCategoryId; // 選択したカテゴリーに更新
    const yahoo_genre_category_id = yahoo_genreCategory_id(categoryIdToUse);
    console.log(yahoo_genre_category_id);
  }
  categorySelect.addEventListener('change', handleCategoryChange);

  itemNameInput.addEventListener('input', function () {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(function () {
      const query = itemNameInput.value;
      const yahoo_genre_category_id = yahoo_genreCategory_id(categoryIdToUse);
      console.log(yahoo_genre_category_id);
      console.log(query);

      fetch(`/items/search?query=${query}&yahoo_genre_category_id=${yahoo_genre_category_id}`, {
        method: 'GET',
        headers: {
          'Content-Type': 'application/json',
        },
      })
        .then(response => {
          if (!response.ok) {
            throw new Error('HTTPリクエストエラー');
          }
          return response.json();
        })
        .then(data => {
          console.log(data);
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
            const noItemsMessage = document.createElement('p');
            noItemsMessage.textContent = 'No items found.';
            suggestedItems.appendChild(noItemsMessage);
          }
        })
        .catch(error => {
          console.error('エラー:', error);
        });
    }, 500);
  });

  function yahoo_genreCategory_id(categoryIdToUse) {
    const categoryDefaults = {
      1: { id: 15152 },
      2: { id: 1371 },
      3: { id: 1359 },
      4: { id: 1348 },
      5: { id: 1339 },
      6: { id: 18161 },
    };
    return categoryDefaults[categoryIdToUse].id;
  }
});
