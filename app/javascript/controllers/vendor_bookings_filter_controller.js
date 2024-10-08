import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="vendor-bookings-filter"
export default class extends Controller {
	static targets = ["cards"];

	filter(event) {
		const status = event.target.dataset.status;
		const buttons = document.querySelectorAll(".buttons p");
		buttons.forEach((button) => {
			button.classList.remove(
				"font-weight-bold",
				"border-bottom",
				"border-primary"
			);
		});
		event.target.classList.add(
			"font-weight-bold",
			"border-bottom",
			"border-primary"
		);
		this.filterCards(status);
	}

	filterCards(status) {
		const cards = this.cardsTarget.querySelectorAll(".booking-card");
		cards.forEach((card) => {
			if (status === "all" || card.dataset.status === status) {
				card.classList.remove("d-none");
				card.classList.add("d-flex");
			} else {
				card.classList.remove("d-flex");
				card.classList.add("d-none");
			}
		});
	}
}
