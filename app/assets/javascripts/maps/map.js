function buildMap() {
  jQuery(document).ready(function() {
    jQuery('#vmap').vectorMap(
      {
        map: 'usa_en',
        backgroundColor: '#ECF0F1',
        borderColor: '#ECF0F1',
        color: '#2C3E50',
        hoverColor: '#E74C3C',
        onRegionLabelShow:  function (el, code, region) {
          tooltip(el, code);
        },
        onRegionClick: function (event, code, region) {
          console.log(code)
          window.location = "states/" + region
        }
    });
  });
}

function tooltip(el, code) {
  region = code
  el.html(el.html() + region)
}
