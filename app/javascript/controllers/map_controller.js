import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {

  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
      center:[ this.markerValue.lng, this.markerValue.lat ], // starting position [lng, lat]
      zoom: 14 // starting zoom
    })
    console.log(this.apiKeyValue);
    console.log(this.markerValue);
    this.#addMarkerToMap();
  }

  #addMarkerToMap() {
    new mapboxgl.Marker()
      .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
      .addTo(this.map)
  }
}
