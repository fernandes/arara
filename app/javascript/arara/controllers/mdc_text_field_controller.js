// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCTextField } from "@material/textfield"

export default class extends Controller {
  static targets = ["element", "helperLine"]

  connect() {
    const el = new MDCTextField(this.elementTarget)
    this.el = el
  }

  handleFocus(e) {
    this.elementTarget.classList.remove("mdc-text-field--error")
    if (this.hasHelperLineTarget) {
      if (this.helperLineTarget.classList.contains("mdc-text-field-helper-line--error")) {
        this.helperLineTarget.querySelector("p").innerHTML = ""
      }
      this.helperLineTarget.classList.remove("mdc-text-field-helper-line--error")
    }
  }

  disconnect() {
    this.el.destroy()
    this.el = null
  }
}
