$(document).on('turbolinks:load' ,function() {
  $("#tag-input").tagit({
    fieldName: 'tags',
    singleField: true,
    allowSpaces: true
  });
  $('#article-tags').tagit()
  const tag_string = $('#hidden_tag').val();
  try {
    tag_list = tag_string.split(',');
    for (const tag of tag_list) {
      $('#tag-input').tagit('createTag', tag);
      console.log(tag)
    }
    
  } catch (error) {
    
  }
});

