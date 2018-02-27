$(document).ready(function() {
  $('.paste').click(function(event) {
    $(this).next().toggleClass("inactive");
  });

  $('.left-button').click(function(event) {
    $('.left-button').addClass("button-activated");
    $('.left-button').removeClass("button-deactivated");
    $('.right-button').addClass("button-deactivated");
    $('.right-button').removeClass("button-activated");
    $('.add-files-wrapper').removeClass("inactive-full-width");
    $('.view-existing-files-wrapper').addClass("inactive-full-width");
  })

  $('.right-button').click(function(event) {
    $('.right-button').addClass("button-activated");
    $('.right-button').removeClass("button-deactivated");
    $('.left-button').addClass("button-deactivated");
    $('.left-button').removeClass("button-activated");
    $('.add-files-wrapper').addClass("inactive-full-width");
    $('.view-existing-files-wrapper').removeClass("inactive-full-width");
  })
})
