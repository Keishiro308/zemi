$(document).on('turbolinks:load', function(){
  $('#top_btn').on('click', function(){
    console.log('hello')
    $('html').animate({scrollTop:10});
  });
});