function buildSlider() {
  jQuery(document).ready(function() {
    $('.single-item').slick({
      dots: true,
      arrows: true,
      autoplay: false,
      autoplaySpeed: 1000,
    });
  });
}
