$(document).on('turbolinks:load', function(){
  const menu = $('#menu');
  $('#menu-btn').on('click',function(){
    menu.slideToggle(300);
  });
});