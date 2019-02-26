// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

function locationSearch(){

}

function updateInfo(id){
  fetch(`/update?id=${id}`)
  .then(response => response.json())
  .then(function(data){
    attrs = data['data']['attributes']
    timestamp = attrs["timestamp"]
    conditions = attrs["conditions"]
    waves = attrs["swell"]
    wind = attrs["wind"]

    updateLocationLabel(attrs['location_name'], attrs['region_name'])
    updateTimestamp(timestamp)
    updateConditions(conditions)
    updateWaves(waves)
    updateWind(wind)
  })
  .catch(error => console.error(error))
}

function updateLocationLabel(locationName, regionName){
  document.getElementById('location-name').innerHTML = locationName
  document.getElementById('subregion-name').innerHTML = regionName
}

function updateTimestamp(unixTimestamp){
  date = new Date(unixTimestamp*1000)
  document.getElementById('time-value').innerHTML = (date)
}
function updateConditions(conditionsData){
  document.getElementById('temp').innerHTML = conditionsData["temperature"]
  document.getElementById('pressure').innerHTML = `${conditionsData["pressure"]} ${conditionsData["unitPressure"]}`
}
function updateWaves(waveData){
  document.getElementById('min-breaking-height').innerHTML = waveData["minBreakingHeight"]
  document.getElementById('max-breaking-height').innerHTML = waveData["maxBreakingHeight"]

}
function updateWind(windData){
  document.getElementById('wind-speed').innerHTML = windData["speed"]
  document.getElementById('direction').innerHTML = windData["direction"]
  document.getElementById('wind-chill').innerHTML = windData["chill"]
}
