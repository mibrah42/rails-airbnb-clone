function resizeCard(symbol){
  var height_card = $(".card-img").height();
        $(".card-img").css("height", eval(height_card+symbol+1));
      var width_container = (($(window).width() - $("#map_position").width()) / $(window).width())*100;
      $(".cards-container").css("width", width_container+"%");

}

// RUBEN

$(function(){
 var resize = $(window).width();
 resizeCard("+");
  $(window).resize(function(){
    //console.log( $( window ).width() );
    if(resize > $(window).width() ){
        resizeCard("-");
    }
    else{
        resizeCard("+");
    }
    resize = $(window).width();
  });

});
