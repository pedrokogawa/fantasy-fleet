import { Controller } from "@hotwired/stimulus";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

// Connects to data-controller="location-autocomplete"
export default class extends Controller {
	static values = { apiKey: String };

	static targets = ["location"];
	connect() {
		this.geocoder = new MapboxGeocoder({
			accessToken:
				"pk.eyJ1IjoicGtvZ2F3YSIsImEiOiJjbHlzazd6eWEwZ252MnFzNmFmM21uMWdvIn0.RjcLs7simKtubr8Y8btdzw",
			types: "country,region,place,postcode,locality,neighborhood,address",
		});
		this.geocoder.addTo(this.element);
		this.geocoder.on("result", (event) => this.#setInputValue(event));
		this.geocoder.on("clear", () => this.#clearInputValue());
	}
	#setInputValue(event) {
		this.locationTarget.value = event.result["place_name"];
	}
	#clearInputValue() {
		this.locationTarget.value = "";
	}
	disconnect() {
		this.geocoder.onRemove();
	}
}
