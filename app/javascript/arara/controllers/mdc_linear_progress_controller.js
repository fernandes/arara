// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCLinearProgress } from "@material/linear-progress"

export default class extends Controller {
  connect() {
    const el = new MDCLinearProgress(this.element)
    this.el = el
  }
}
