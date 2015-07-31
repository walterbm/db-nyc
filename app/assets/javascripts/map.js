var map, heatmap;
var type_layers = {};
var current_type = 'All Data';

var styling = [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#e9e9e9"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#ffffff"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#ffffff"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#ffffff"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#f5f5f5"},{"lightness":21}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#dedede"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#ffffff"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#333333"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#f2f2f2"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#fefefe"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#fefefe"},{"lightness":17},{"weight":1.2}]}]

var mapOptions = {
  zoom: 11,
  streetViewControl: false, 
  draggable: true, 
  scrollwheel: false,
  panControl: true, 
  styles: styling,
  mapTypeControl: false,
  center: new google.maps.LatLng(40.7731295,-73.957734),
  mapTypeId: google.maps.MapTypeId.ROADMAP
};

function toggleHeatmap() {
  heatmap.setMap(heatmap.getMap() ? null : map);
}

function setType(type) {
  current_type = type;
  $('#desc').html(current_type);
}

function setHour(hour) {
  var tmpHeatMap = heatmap;

  hour = Math.round(hour);

  $("#hour").val(hour + ":00");

  if (!!type_layers[current_type][hour]) {
    heatmap = type_layers[current_type][hour];
    heatmap.setMap(map);
  }
  setTimeout(function(){tmpHeatMap.setMap(null);}, 80);
}

$(function() {
  map = new google.maps.Map(document.getElementById('map-canvas'),
  mapOptions);

  $( "#slider" ).slider({
    value: 12,
    min: 0,
    max: 23,
    step: 0.1,
    slide: function( event, ui ) {
      if (parseInt($("#hour").val()) !== Math.round(ui.value)) {
        setHour(ui.value);
      }
    }
  });
  $( "#hour" ).val( $( "#slider" ).slider( "value" ) + ':00');

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

    $(".dropdown-menu").on('click', 'li a', function(){
      $(".btn:first-child").text($(this).text());
      $(".btn:first-child").val($(this).text());
   });

});
