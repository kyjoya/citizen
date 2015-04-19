function buildSlider() {
  jQuery(document).ready(function() {
    $('.single-item').slick({
      autoplay: true,
      autoplaySpeed: 3500,
      arrows: true,
      adaptiveHeight:true
    });
  });
}
