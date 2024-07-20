import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";

// Connects to data-controller="map"
export default class extends Controller {
	static values = {
		apiKey: String,
		markerLat: String,
		markerLng: String,
	};

	connect() {
		mapboxgl.accessToken =
			"pk.eyJ1IjoicGtvZ2F3YSIsImEiOiJjbHlzazd6eWEwZ252MnFzNmFmM21uMWdvIn0.RjcLs7simKtubr8Y8btdzw";
		this.map = new mapboxgl.Map({
			container: this.element,
			style: "mapbox://styles/mapbox/streets-v11",
			center: [this.markerLngValue, this.markerLatValue], // Coordenadas iniciais do mapa
			zoom: 9,
		});
		this.#addMarkersToMap();
	}
	#addMarkersToMap() {
		new mapboxgl.Marker()
			.setLngLat([this.markerLngValue, this.markerLatValue])
			.addTo(this.map);
	}
}
