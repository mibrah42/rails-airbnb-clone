//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary

//= require bootstrap-datepicker

//= require underscore
//= require gmaps/google

//= require_tree .

$(document).ready(function(){

  $('.datepicker').datepicker({
      daysOfWeekDisabled: "0,6",
      daysOfWeekHighlighted: "1,2,3,4,5",
      todayHighlight: true
  });

});


