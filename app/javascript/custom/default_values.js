const categoryDefaults = {
  1: { alcohol_content: 5.0, size: 350 },
  2: { alcohol_content: 14.0, size: 750 },
  3: { alcohol_content: 16.0, size: 720 },
  4: { alcohol_content: 25.0, size: 1800 },
  5: { alcohol_content: 40.0, size: 700 },
  6: { alcohol_content: 6.0, size: 350 }
};

jQuery(function() {
  $(document).on('change', '#item_category_id', function() {
    const categoryId = $(this).val();
    const defaultValues = categoryDefaults[categoryId];

    if (defaultValues) {
      // 初期値をフィールドにセット
      $('#item_alcohol_content').val(defaultValues.alcohol_content);
      $('#item_size').val(defaultValues.size);
    }
  });
});

