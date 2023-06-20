$(document).ready(function(){
  $('#item_category_id').change(function() {
    var categoryId = $(this).val();
    $.ajax({
      url: '/categories/' + categoryId + '/default_values',
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        $('#item_alcohol_content').val(data.default_alcohol_content);
        $('#item_size').val(data.default_size);
      }
    });
  });
});