// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCSelect } from "@material/select"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    const el = new MDCSelect(this.element)

    // initialize with the selected value
    this.inputTarget.value = el.value

    el.listen("MDCSelect:change", () => {
      this.inputTarget.value = el.value
    })
    this.el = el
  }
}
