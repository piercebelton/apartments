// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

function placeMakers(dataFromServer, markers) {
  markers = handler.addMarkers(dataFromServer);
  handler.bounds.extendWith(markers);
  handler.fitMapToBounds();
}

function showLocations(dataFromServer) {

  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        alert(position);
      // Add our position to the collection of markers
      dataFromServer[dataFromServer.length] = {
        lat: position.coords.latitude,
        lng: position.coords.longitude,
        infowindow: "You!"
      };
      placeMakers(dataFromServer, markers);
    });
  } else {
      alert("Geolocation is not available.");
      placeMakers(dataFromServer, markers)
  }
}

function createGmap(dataFromServer) {

  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'crib_map'}
    },
    function() {
      showLocations(dataFromServer);
      markers = handler.addMarkers(dataFromServer);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
};

function createGmaps(dataFromServer) {
  handler = Gmaps.build('Google');
  handler.buildMap({
      provider: {},
      internal: {id: 'cribs_map'}
    },
    function() {
      showLocations(dataFromServer);
      markers = handler.addMarkers(dataFromServer);
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
    }
  );
};

function loadAndCreateGmap() {
  // Only load map data if we have a map on the page
  if ($('#crib_map').length > 0) {

    // Access the data-crib-id attribute on the map element
    var cribId = $('#crib_map').attr('data-crib-id');

    $.ajax({
      dataType: 'json',
      url: '/cribs/' + cribId + '/map_location',
      method: 'GET',
      success: function(dataFromServer) {
        createGmap(dataFromServer);
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

function loadAndCreateMap() {

  if ($('#cribs_map').length > 0) {
    $.ajax({
      dataType: 'json',
      url: '/cribs/map_locations',
      method: 'GET',
      success: function(dataFromServer) {
        createGmaps(dataFromServer)
      },
      error: function(jqXHR, textStatus, errorThrown) {
        alert("Getting map data failed: " + errorThrown);
      }
    });
  }
};

// Create the map when the page loads the first time
$(document).on('ready', loadAndCreateGmap);
$(document).on('ready', loadAndCreateMap);


// // To be 'turbolinks:load' in Rails 4
// $(document).on('turbolinks:load', loadAndCreateGmap);
// $(document).on('turbolinks:load', loadAndCreateMap);
