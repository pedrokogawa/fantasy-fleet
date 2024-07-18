import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="status-style"
export default class extends Controller {
	static targets = ["statusElement"];

	connect() {
		this.updateStatus();
	}

	updateStatus() {
		if (this.statusElementTarget.dataset.status === "waiting") {
			this.statusElementTarget.classList.add(
				"border",
				"border-secondary",
				"text-secondary",
				"p-1",
				"rounded"
			);
		} else if (this.statusElementTarget.dataset.status === "accepted") {
			this.statusElementTarget.classList.add(
				"border",
				"border-success",
				"text-success",
				"p-1",
				"rounded"
			);
		} else if (this.statusElementTarget.dataset.status === "refused") {
			this.statusElementTarget.classList.add(
				"border",
				"border-danger",
				"text-danger",
				"p-1",
				"rounded"
			);
		} else if (this.statusElementTarget.dataset.status === "canceled") {
			this.statusElementTarget.classList.add(
				"border",
				"border-danger",
				"text-danger",
				"p-1",
				"rounded"
			);
		} else if (this.statusElementTarget.dataset.status === "completed") {
			this.statusElementTarget.classList.add(
				"border",
				"border-info",
				"text-info",
				"p-1",
				"rounded"
			);
		} else if (this.statusElementTarget.dataset.status === "ongoing") {
			this.statusElementTarget.classList.add(
				"border",
				"border-warning",
				"text-warning"
			);
		}
	}
}
