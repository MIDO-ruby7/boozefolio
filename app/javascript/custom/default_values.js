
const categoryDefaults = {
  1: { alcohol_content: 5.0, size: 350 },
  2: { alcohol_content: 14.0, size: 750 },
  3: { alcohol_content: 16.0, size: 720 },
  4: { alcohol_content: 25.0, size: 1800 },
  5: { alcohol_content: 40.0, size: 700 },
  6: { alcohol_content: 6.0, size: 350 }
};

jQuery(function() {
  // ページ読み込み時にdata-category-idから@category_idの値を取得
  const categoryId = $('#category-id').data('category-id');
  const defaultValues = categoryDefaults[categoryId];
  console.log(categoryId);
  console.log(defaultValues);

  if (defaultValues) {
    // 初期値をフィールドにセット
    $('#item_alcohol_content').val(defaultValues.alcohol_content);
    $('#item_size').val(defaultValues.size);

    const valueDisplay = document.querySelector('#value-display');
    if (valueDisplay) {
      valueDisplay.textContent = defaultValues.alcohol_content;
    }
    $('#item_category_id').val(categoryId);
  }

  // カテゴリが変更されたときの処理
  $(document).on('change', '#item_category_id', function() {
    const categoryId = $(this).val();
    const defaultValues = categoryDefaults[categoryId];

    if (defaultValues) {
      // 初期値をフィールドにセット
      $('#item_alcohol_content').val(defaultValues.alcohol_content);
      $('#item_size').val(defaultValues.size);

      const valueDisplay = document.querySelector('#value-display');
      if (valueDisplay) {
        valueDisplay.textContent = defaultValues.alcohol_content;
      }
    }
  });
});
