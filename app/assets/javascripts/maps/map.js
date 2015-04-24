function buildMap() {
  jQuery(document).ready(function() {
    jQuery('.vmap').vectorMap(
      {
        map: 'usa_en',
        backgroundColor: '#FFFFFF',
        borderColor: '#ECF0F1',
        color: '#3C2200',
        hoverColor: '#2C3E50',
        selectedColor: '#FFFFFF',
        enableZoom: false,
        onRegionClick: function (event, code, region) {
          color: '#FFFFFF',
          console.log(code)
          window.location = "states/" + region
        }
    });
  });
}
