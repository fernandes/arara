const { module, test } = QUnit
import { Application } from "stimulus";
import { counter_controller as CounterController } from '../../../../app/javascript/arara/index'
import { defer } from '../helpers'

let fixtureDiv;

module("CounterController", hooks => {
  hooks.beforeEach((assert) => {
    fixtureDiv = document.querySelector("#qunit-fixture")
    fixtureDiv.innerHTML = `
    <div data-controller="counter">
    <h3 data-target="counter.display" type="text">NaNBforeeee</h3>
    
    <button data-action="click->counter#increase">
    +
    </button>
    | 
    <button data-action="click->counter#decrease">
    -
    </button>
    </div>`;

    const application = Application.start();
    application.register("counter", CounterController);
  })

  module("#increase", () => {
    test("increases the value to 1", assert => {
      const increaseButton = fixtureDiv.querySelector("button[data-action='click->counter#increase']");
      const displayTarget = fixtureDiv.querySelector("[data-target='counter.display']");

      var done = assert.async(2);

      defer(() => {
        increaseButton.click();
        done();
      })

      defer(() => {
        assert.equal(displayTarget.innerHTML, "1", "Counter is showing 1");
        done();
      })
    });
  });

  module("#decrease", () => {
    test("decreases the value to -1", assert => {
      const decreaseButton = fixtureDiv.querySelector("button[data-action='click->counter#decrease']");
      const displayTarget = fixtureDiv.querySelector("[data-target='counter.display']");

      var done = assert.async(2);

      defer(() => {
        decreaseButton.click();
        done()
      })

      defer(() => {
        assert.equal(displayTarget.innerHTML, "-1", "Counter is showing -1");
        done()
      })
    });
  });

  module("multiple clicks", () => {
    test("increases and decreases in sequence", assert => {
      const increaseButton = fixtureDiv.querySelector("button[data-action='click->counter#increase']");
      const decreaseButton = fixtureDiv.querySelector("button[data-action='click->counter#decrease']");
      const displayTarget = fixtureDiv.querySelector("[data-target='counter.display']");

      var done = assert.async(2);

      defer(() => {
        increaseButton.click();
        increaseButton.click();
        increaseButton.click();
        increaseButton.click();
        decreaseButton.click();
        decreaseButton.click();
        done()
      })

      defer(() => {
        assert.equal(displayTarget.innerHTML, "2", "Counter is showing 2");
        done()
      })
    });
  });
});
