import { Controller } from "@hotwired/stimulus";
import mapboxgl from "mapbox-gl";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="maps"
export default class extends Controller {
	static values = {
		apiKey: String,
		markers: Array,
	};

	connect() {
		console.log(this.apiKeyValue);
		const modalElement = document.getElementById("map-modal");
		mapboxgl.accessToken = this.apiKeyValue;
		console.log(mapboxgl.accessToken);
		modalElement.addEventListener("shown.bs.modal", () => {
			setTimeout(() => {
				this.map.resize();
				this.#fitMapToMarkers();
			}, 5); // Pequeno delay para garantir o redimensionamento correto
		});

		this.map = new mapboxgl.Map({
			container: this.element,
			style: "mapbox://styles/mapbox/streets-v10",
		});
		this.#addMarkersToMap();
		this.#fitMapToMarkers();
		this.map.addControl(
			new MapboxGeocoder({
				accessToken: mapboxgl.accessToken,
				mapboxgl: mapboxgl,
			})
		);
	}
	#addMarkersToMap() {
		this.markersValue.forEach((marker) => {
			const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
			new mapboxgl.Marker()
				.setLngLat([marker.lng, marker.lat])
				.setPopup(popup)
				.addTo(this.map);
		});
	}
	#fitMapToMarkers() {
		const bounds = new mapboxgl.LngLatBounds();
		this.markersValue.forEach((marker) =>
			bounds.extend([marker.lng, marker.lat])
		);
		this.map.fitBounds(bounds, { padding: 40, maxZoom: 15, duration: 1000 });
	}
}
