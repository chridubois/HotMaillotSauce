import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-updater"
export default class extends Controller {

  static targets = ["begin_date", "end_date", "total_amount", "price_per_day", "total_amount_input"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  end_date_refresher() {
    const begin_date = new Date(this.begin_dateTarget.value)
    const tomorrow = new Date()
    let new_date = ""
    tomorrow.setDate(begin_date.getDate()+1)
    console.log(tomorrow)
    if ((tomorrow.getMonth()+1) < 10) {
      if (tomorrow.getDate() < 10) {
        new_date = `${tomorrow.getFullYear()}-0${tomorrow.getMonth()+1}-0${tomorrow.getDate()}`
      } else {
        new_date = `${tomorrow.getFullYear()}-0${tomorrow.getMonth()+1}-${tomorrow.getDate()}`
      }
    } else {
      if (tomorrow.getDate() < 10) {
        new_date = `${tomorrow.getFullYear()}-${tomorrow.getMonth()+1}-0${tomorrow.getDate()}`
      } else {
        new_date = `${tomorrow.getFullYear()}-${tomorrow.getMonth()+1}-${tomorrow.getDate()}`
      }
    }
    console.log(new_date)
    this.end_dateTarget.min = new_date
    this.end_dateTarget.value = new_date
  }

  total_amount_refresher() {
    const begin_date = new Date(this.begin_dateTarget.value)
    const end_date = new Date(this.end_dateTarget.value)
    const number_of_days = (end_date - begin_date)/86400/1000
    const price_per_day = this.price_per_dayTarget.textContent.split('$')[0]
    const new_amount = `${(price_per_day * 1 * number_of_days) * 1}$`
    this.total_amountTarget.textContent = new_amount
    this.total_amount_inputTarget.value = new_amount
  }
}
