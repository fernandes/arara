import { sum } from '../../../../app/javascript/arara/index'
const { module, test } = QUnit

module("Sum", () => {
  test("sums correctly", assert => {
    assert.equal(4, sum(2, 2))
  })
})
