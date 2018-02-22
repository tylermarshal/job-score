$(document).ready(function() {
  $('.paste').click(function(event){
    $(this).next().toggleClass("inactive")
  });
})
