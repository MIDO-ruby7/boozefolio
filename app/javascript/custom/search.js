var preFunc = null;
var preInput = "";
var ajaxItem = function(input){
  console.log("input");
  console.log(ajaxItem);
  $.ajax({
    url: "search",
    type: "GET",
    data: ("search=" + input),
    dataType: 'json',
  })

  .done(function(data) {
    console.log(data);
    $('#js_result').empty();
    $(data).each(function(i, item) {
      $('#js_result').append('<li><a href="/items/' + item.id + '">' + item.name + '</a></li>');
    });
  })
  .fail(function() {
    console.log("Ajax request failed");
  });
};

$('#js_search_items').on('keyup', function(){
  var input = $(this).val().trim();
  if (preInput !== input) {
    clearTimeout(preFunc);
    preFunc = setTimeout(function() {
      ajaxItem(input);
    }, 500);
  }
  preInput = input;
});
