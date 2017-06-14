$(document).ready(function() {
  var flat_address = $('#input-destination').get(0);

  if (flat_address) {
    var autocomplete = new google.maps.places.Autocomplete(flat_address, { types: ['geocode'] });
  }
});
