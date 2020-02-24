class Arara::StepperComponent < ActionView::Component::Base
  include Arara::BaseComponent
  attr_reader :orientation, :alternative_label

  validates :content, presence: true

  def initialize(orientation: "horizontal", alternative_label: false, **kw)
    @orientation = orientation
    @alternative_label = alternative_label
    super(tag: "div", **kw)
  end

  def default_html_class
    classes = %w(MuiStepper-root)
    classes.push("MuiStepper-horizontal") if orientation == "horizontal"
    classes.push("MuiStepper-vertical") if orientation == "vertical"
    classes.push("MuiStepper-alternativeLabel") if alternative_label
    classes.join(" ")
  end
end
