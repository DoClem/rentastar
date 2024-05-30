import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickrRangePlugin"


// Connects to data-controller="datepicker"
export default class extends Controller {
  static targets = ["start", "endDate"]
  static values = { unavailableDates: Array }

  connect() {
    flatpickr(this.startTarget, {
      minDate: "today",
      dateFormat: "Y-m-d",
      "disable": this.unavailableDatesValue,

      "plugins": [new rangePlugin({input: this.endDateTarget})]
    })
  }
}
