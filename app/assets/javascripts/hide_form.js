$(document).ready(function() {
  $("#petition_form").hide();

  $('#new_petition').on('click', function(e) {
    e.preventDefault();

    $("#petition_form").show();

    $(this).on('click', function() {
      $("#petition_form").hide();
    });

    if ($('#petition_form').is(':hidden')) {
      $('#petition_form').slideDown('slow');
    }
  });

});
