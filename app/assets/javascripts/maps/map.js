function buildMap() {
  jQuery(document).ready(function() {
    jQuery('.vmap').vectorMap(
      {
        map: 'usa_en',
        backgroundColor: '#FFFFFF',
        borderColor: '#ECF0F1',
        color: '#2C3E50',
        hoverColor: '#3C2200',
        selectedColor: '#FFFFFF',
        enableZoom: false,
        onRegionClick: function (event, code, region) {
          color: '#FFFFFF',
          window.location = "states/" + region
        }
    });
  });
}
