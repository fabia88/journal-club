//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(".alert").delay(5000).slideUp(500, function(){
  $(".alert").alert('close');
});
