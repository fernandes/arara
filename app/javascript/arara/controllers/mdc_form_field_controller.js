// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCFormField } from "@material/form-field"
import { MDCCheckbox } from "@material/checkbox"
import { MDCRadio } from "@material/radio"

export default class extends Controller {
  connect() {
    const formField = new MDCFormField(this.element)

    this.checkboxes = [].map.call(this.element.querySelectorAll(".mdc-checkbox"), function (el) {
      const checkbox = new MDCCheckbox(el)
      if (el.dataset.indeterminate == "true") {
        checkbox.indeterminate = true
      }

      if (el.dataset.checked == "true") {
        checkbox.checked = true
      }
      formField.input = checkbox
      return checkbox
    })

    this.radios = [].map.call(this.element.querySelectorAll(".mdc-radio"), function (el) {
      const radio = new MDCRadio(el)
      formField.input = radio
      return radio
    })

    this.el = formField
  }
}
