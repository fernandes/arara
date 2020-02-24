// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import { MDCDialog } from "@material/dialog"

export default class extends Controller {
  static targets = ["button", "dialog"]

  connect() {
    const dialog = new MDCDialog(this.dialogTarget)
    this.dialog = dialog
  }

  openDialog() {
    this.dialog.open()
  }
}
