$(document).on('turbolinks:load', function() {
  $(document).on('keyup', '#search_items', function(e) {
    e.preventDefault();
    var input = $(this).val().trim();
    comsole.log(input);

    $.ajax({
      url: '/items/search_result',
      type: 'GET',
      data: { name: input },
      dataType: 'json'
    })
    .done(function(data) {
      console.log(data);
      $('#result').empty();
      $(data).each(function(i, item) {
        $('#result').append('<li><a href="/items/' + item.id + '">' + item.name + '</a></li>');
      });
    });
  });
});
