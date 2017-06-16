$(document).ready(function(){


var today = new Date();
var dd = today.getDate();
var mm = today.getMonth()+1; //January is 0!
var yyyy = today.getFullYear();

if(dd<10) {
    dd='0'+dd
}
if(mm<10) {
    mm='0'+mm
}
today = mm+'/'+dd+'/'+yyyy;


  $('#daterange').daterangepicker({
    "timePickerIncrement": 1,
    "opens": "right",
    "drops": "down",
    "autoApply": true,
    "minDate": today,
  });
  $("#daterange").val("Anytime")
});
