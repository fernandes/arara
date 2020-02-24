// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCSnackbar } from "@material/snackbar"

export default class extends Controller {
  static targets = ["button", "snackbar"]

  connect() {
    if (window.snackbarQueue == undefined) {
      window.snackbarQueue = []
    }
    this.queue = window.snackbarQueue
    this.snackbar = new MDCSnackbar(this.snackbarTarget)
    this.snackbar.listen("MDCSnackbar:closed", () => this.handleClosed())
  }

  openSnackbar() {
    this.queue.push(() => this.snackbar.open())
    if (this.queue.length === 1) {
      this.queue[0]()
    }
  }

  handleClosed() {
    this.queue.shift()
    if (this.queue.length > 0) {
      this.queue[0]()
    }
  }
}
