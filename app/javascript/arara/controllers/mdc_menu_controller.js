// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCMenu } from "@material/menu"

export default class extends Controller {
  static targets = ["button", "menu"]

  connect() {
    const menu = new MDCMenu(this.menuTarget)
    this.menu = menu
  }

  openMenu() {
    const isOpen = this.menuTarget.classList.contains("mdc-menu-surface--open")
    this.menu.open = !isOpen
  }
}
