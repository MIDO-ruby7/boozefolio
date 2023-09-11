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

              // 商品名をクリックしたらテキストフィールドに自動入力
              itemLink.addEventListener('click', function () {
                itemNameInput.value = item.name; // 商品名をテキストフィールドにセット

                // jan_code フィールドに janCode をセット
                const janCodeField = document.querySelector('#item_jan_code');
                if (janCodeField) {
                  janCodeField.value = item.janCode;
                }

                // maker フィールドに parentBrandName をセット
                const makerField = document.querySelector('#item_maker');
                if (makerField) {
                  makerField.value = item.parentBrandName;
                }

                suggestedItems.innerHTML = ''; // 選択後、候補をクリア
              });

              suggestedItems.appendChild(itemLink);
            });
          } else {
            const noItemsMessage = document.createElement('p');
            renderItems(data);
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

function renderItems(data) {
  console.log(data);
  $('#suggested-items').empty(); // 既存の内容をクリア

  // JSON データ内の各アイテムに対して処理を行う
  data.forEach(item => {
    const itemLink = document.createElement('a');
    itemLink.textContent = item.name;
    itemLink.href = `/items/${item.id}`; // リンク先を設定

    $('#suggested-items').append(itemLink); // リンクを div に追加
  });
}

const urlParams = new URLSearchParams(window.location.search);

const nameField = document.getElementById('item_name');
const parentBrandField = document.getElementById('item_maker');
const janCodeField = document.getElementById('item_jan_code');

const nameValue = urlParams.get('name');
const makerValue = urlParams.get('maker');
const janCodeValue = urlParams.get('janCode');

console.log(nameValue);
console.log(makerValue);
console.log(janCodeValue);

if (nameValue) {
  nameField.value = nameValue;
}
if (makerValue) {
  parentBrandField.value = makerValue;
}
if (janCodeValue) {
  janCodeField.value = janCodeValue;
}
