var map, heatmap;
var type_layers = {};
var current_type = 'All Data';

function toggleHeatmap() {
  heatmap.setMap(heatmap.getMap() ? null : map);
}

function setType(type) {
  current_type = type;
  $('#desc').html(current_type);
}

function setHour(hour) {
  heatmap.setMap(null);
  if (!!type_layers[current_type][hour]) {
    heatmap = type_layers[current_type][hour];
    heatmap.setMap(map);
  }
}

$(function() {
  $( "#slider" ).slider({
    value:12,
    min: 0,
    max: 23,
    step: 1,
    slide: function( event, ui ) {
      $( "#hour" ).val( ui.value + ":00" );
    }
  });
  $( "#hour" ).val( $( "#slider" ).slider( "value" ) + ':00');

  $( "#slider" ).on( "slide", function( event, ui ) {
    setHour(ui.value);
  });

  $(".dropdown-menu").on("click", "li", function(e) {
    setType($(e.target).text());

    if (!type_layers[current_type]) {
      $.ajax({
        url: '/descriptor',
        method: 'GET',
        data: {descriptor: current_type},
        dataType: 'script'
      });
    }
    else {
      setHour($('#slider').slider("value"));
    }
  });
});
