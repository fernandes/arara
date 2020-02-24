// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCSlider } from "@material/slider"

export default class extends Controller {
  connect() {
    const el = new MDCSlider(this.element)
    el.listen("MDCSlider:change", () => {
      alert(`Value changed to ${el.value}`)
    })
    this.el = el
  }
}
