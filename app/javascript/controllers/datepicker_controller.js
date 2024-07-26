import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
export default class extends Controller {
  connect() {
    const datesJson = this.element.dataset.dates; // GET values from the form
    const disabledDates = JSON.parse(datesJson || "[]"); // PARSE to JSON

    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      maxDate: new Date().fp_incr(365),
      disable: disabledDates.flatMap(dateRange => {
        return {
          from: dateRange.from,
          to: dateRange.to
        };
      })
    })
  }
}
