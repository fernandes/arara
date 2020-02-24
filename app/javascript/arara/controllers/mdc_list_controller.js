// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCRipple } from "@material/ripple"
import { MDCList } from "@material/list"

export default class extends Controller {
  connect() {
    const list = new MDCList(this.element)

    const listItemRipples = list.listElements.map((listItemEl) => new MDCRipple(listItemEl))

    this.listItemRipples = listItemRipples
    this.el = list
  }
}
