console.log('yahoo_api.js loaded');

document.addEventListener('DOMContentLoaded', function () {
  const itemNameInput = document.querySelector('#item_name');
  const suggestedItems = document.querySelector('#suggested-items');
  let timeoutId;

  // category_idの値を取得
  const categoryElement = document.querySelector('#category-id');
  const category_id = categoryElement.dataset.categoryId;
  console.log(category_id);

  itemNameInput.addEventListener('input', function () {
    clearTimeout(timeoutId);
    timeoutId = setTimeout(function () {
      const query = itemNameInput.value;
      const yahoo_genre_category_id = yahoo_genreCategory_id(category_id);
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
          // レスポンスを処理
          console.log(data);
        })
        .catch(error => {
          console.error('エラー:', error);
        });
    }, 500);
  });


  function yahoo_genreCategory_id(category_id) {
    const categoryDefaults = {
      1: { id: 15152 },
      2: { id: 1371 },
      3: { id: 1359 },
      4: { id: 1348 },
      5: { id: 1339 },
      6: { id: 18161 },
    };
    return categoryDefaults[category_id].id;
  }
});
