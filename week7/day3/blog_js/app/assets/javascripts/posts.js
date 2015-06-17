/* global $ */
//title present
//body min 5
$('#post_title').on('keyup', function () {
  var title_value = $(this).val();
  var error_elem = $(this).parent().find('.errors');

  if (title_value.length < 1) {
    error_elem.text('Title is required');
  } else {
    error_elem.text('');
  }
});

$('#post_body').on('keyup', function () {
  var body_value = $(this).val();
  var error_elem = $(this).parent().find('.errors');

  if (body_value.length <= 5) {
    error_elem.text('Body must be longer than 5 characters');
  } else {
    error_elem.text('');
  }
});

$('#post_category').on('keyup', function () {
  var cat_value = $(this).val();
  var error_elem = $(this).parent().find('.errors');

  if (cat_value.length < 1) {
    error_elem.text('Category is required');
  } else {
    error_elem.text('');
  }
});
