$(function(){

  $(".tab").on("click", function(e){
    // Change active tab
    $(".active").removeClass('active')
    $(this).addClass('active');


    // Hide all tab-content (use class="hidden")

    $(".tab-content").addClass("hidden");

    // Show target tab-content (use class="hidden")
    var id = $(".active").data("target");
    $(id).removeClass("hidden");
  });

});
