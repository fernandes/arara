// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

function scrollTo(element, to = 0, duration = 1000) {

  const start = element.scrollTop
  const change = to - start
  const increment = 20
  let currentTime = 0

  const animateScroll = (() => {

    currentTime += increment

    const val = Math.easeInOutQuad(currentTime, start, change, duration)

    element.scrollTop = val

    if (currentTime < duration) {
      setTimeout(animateScroll, increment)
    }
  })

  animateScroll()
}

Math.easeInOutQuad = function (t, b, c, d) {

  t /= d / 2
  if (t < 1) return c / 2 * t * t + b
  t--
  return -c / 2 * (t * (t - 2) - 1) + b
}


import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    const formId = this.element.id

    this.element.addEventListener("ajax:success", function (e, data, status, xhr) {
      console.log("ajax:success")
      return
    })

    this.element.addEventListener("ajax:error", function (e, xhr, status, error) {
      var parser = new DOMParser()
      var doc = parser.parseFromString(e.detail[2].responseText, "text/html")
      var form = doc.querySelector(`form#${formId}`)

      // sets the new form
      const parentNode = e.target.parentNode
      parentNode.replaceChild(form, e.target)

      // animate to first element with error
      const newForm = parentNode.querySelector(`form#${formId}`)
      const elementWithError = newForm.querySelector(".mdc-text-field--error")

      if (elementWithError) {
        var content = document.querySelector("#content")
        scrollTo(content, (elementWithError.offsetTop - content.offsetTop), 600)
      }
      e.stopPropagation()
      return
    })

    this.element.addEventListener("ajax:complete", function (e, xhr, status, error) {
      e.stopPropagation()
      return
    })
  }
}
