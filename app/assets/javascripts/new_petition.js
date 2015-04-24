function newForm() {
  $('#new_petition').on('mousedown', function(e) {
  e.preventDefault();

  $('#petitions_div').addClass('petition_form');
  $(this).on('mouseup', function() {
    $('#petitions_div').removeClass('petition_form');
  });

  if ($('#petition_form').is(':hidden')) {
    $('#petition_form').slideDown('slow');
  } else {
    $('#petition_form').slideUp('slow');
  }
});

}
