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
  connect() {
    const controller = this.application.getControllerForElementAndIdentifier(this.element, "mdc-chip-set")
    const chipSet = controller.el
    const _this = this

    chipSet.listen("MDCChip:selection", function (event) {
      _this.handleSelection(event)
    })
  }

  handleSelection(event) {
    // console.log("event", event)
    console.log("target", event.target)
    const inputValue = event.target.attributes.value.value
    console.log("inputValue", event.target)
    console.log("detail", event.detail)
    const dataTarget = event.target.dataset.railsChipSetFilterTarget
    console.log("dataTarget", dataTarget)
    const target = this.element.querySelector(`[data-target="${dataTarget}"]`)
    console.log("target", target)
    if (event.detail.selected) {
      target.value = inputValue
    } else {
      target.value = 0
    }
  }
}
