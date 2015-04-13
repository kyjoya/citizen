function buildMap() {
  jQuery(document).ready(function() {
    jQuery('#vmap').vectorMap(
      {
        map: 'usa_en',
        onRegionClick: function (event, code, region) {
          console.log(code)
          window.location = "states/" + region
        }
      });
});
}
