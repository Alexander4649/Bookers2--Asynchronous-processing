応用課題フェーズ　課題❻ 非同期処理(Asynchronous processing)


$('#favorite_btn_<%= @book.id %>').html("<%= j(render partial: 'favorites/btn', locals: {book: @book}) %>");
$('#favorite_btn_<%= @book.id %>').html("<%= j(render partial: 'favorites/btn', locals: {book: @book}) %>");

$('#favorite_#{@item.id}').html("#{escape_javascript(render "favorites/favorite", item: @item )}");

$('#favorite_buttons_<%= @book.id %>').html("<%= j(render "favorites/favorite", book: @book) %>");
$('#favorite_btn_<%= @book.id %>').html("<%= j(render "favorites/btn", book: @book) %>");
