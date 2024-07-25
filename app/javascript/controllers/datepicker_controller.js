import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
export default class extends Controller {
  static values = {
    disabledDates: Array
  }
  connect() {
    flatpickr(this.element, {
      altInput: true,
      altFormat: "F j, Y",
      dateFormat: "Y-m-d",
      minDate: "today",
      maxDate: new Date().fp_incr(365),
      disable: this.disabledDatesValue.map(date => ({
        from: date.from,
        to: date.to
      }))
    })
  }
}
