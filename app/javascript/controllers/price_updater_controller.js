import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-updater"
export default class extends Controller {

  static targets = ["begin_date", "end_date", "total_amount", "price_per_day"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  total_amount_refresher() {
    const begin_date = new Date(this.begin_dateTarget.value)
    const end_date = new Date(this.end_dateTarget.value)
    const number_of_days = (end_date - begin_date)/86400/1000
    const price_per_day = this.price_per_dayTarget.textContent.split('$')[0]
    this.total_amountTarget.textContent = `${(price_per_day * 1 * number_of_days) * 1}$`
  }
}
