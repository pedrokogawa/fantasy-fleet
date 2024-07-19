// app/javascript/controllers/date_calculator_controller.js
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['startDate', 'endDate', 'dayCount', 'totalPrice'];

  connect() {
    this.updateDayCount(); // Initialize with current values if present
  }

  updateDayCount() {
    const startDate = this.createDateFromInput(this.startDateTarget.value);
    const endDate = this.createDateFromInput(this.endDateTarget.value);

    if (startDate && endDate) {
      const timeDiff = endDate - startDate;
      const daysDiff = (timeDiff / (1000 * 60 * 60 * 24)) + 1;

      this.dayCountTarget.textContent = `Number of days: ${Math.floor(daysDiff)}`;
      this.updateTotalPrice(Math.floor(daysDiff));
    } else {
      this.dayCountTarget.textContent = 'Number of days: 0';
      this.totalPriceTarget.textContent = 'Total estimated price: ';
    }
  }

  updateTotalPrice(daysDiff) {
    // Get the vehicle price per day from a data attribute or other source
    const pricePerDay = parseFloat(this.element.dataset.pricePerDay);

    if (pricePerDay && daysDiff >= 0) {
      const totalPrice = pricePerDay * daysDiff;
      this.totalPriceTarget.textContent = `Total estimated price: ¥${totalPrice}`;
    } else {
      this.totalPriceTarget.textContent = 'Total estimated price: ';
    }
  }

  createDateFromInput(dateInput) {
    if (dateInput) {
      // Create a Date object directly from the dateInput string
      return new Date(dateInput);
    }
    return null;
  }
}
