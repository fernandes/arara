// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["input"]

  connect() {
    const controller = this.application.getControllerForElementAndIdentifier(this.element, "mdc-chip-set")
    const chipSet = controller.el
    const _this = this

    chipSet.listen("MDCChip:selection", function (event) {
      _this.handleSelection(event)
    })
  }

  handleSelection(event) {
    if (event.detail.selected) {
      const value = event.target.attributes.value.value
      this.inputTarget.value = value
    }
  }
}
