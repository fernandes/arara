import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["display"]

  initialize() {
    this.setCounter(0)
  }

  increase() {
    this.setCounter(this.counter + 1)
  }

  decrease() {
    this.setCounter(this.counter - 1)
  }

  setCounter(counter) {
    this.counter = counter
    this.displayTarget.textContent = counter
  }
}
