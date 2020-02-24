class Arara::StepConnectorComponent < ActionView::Component::Base
  include Arara::BaseComponent
  attr_reader :orientation, :active, :alternative_label

  def initialize(orientation: 'horizontal', active: false, alternative_label: false, **kw)
    @orientation = orientation
    @active = active
    @alternative_label = alternative_label

    super(tag: 'div', **kw)
  end

  def default_html_class
    classes = %w(MuiStepConnector-root)
    classes.push("MuiStepConnector-horizontal") if orientation == "horizontal"
    classes.push("MuiStepConnector-vertical") if orientation == "vertical"
    classes.push("MuiStepConnector-active") if active
    classes.push("Mui-disabled") unless active
    classes.push("MuiStepConnector-alternativeLabel") if alternative_label
    classes.join(" ")
  end

  def line_options
    classes = %w(MuiStepConnector-line)
    classes.push("MuiStepConnector-lineHorizontal") if orientation == "horizontal"
    classes.push("MuiStepConnector-lineVertical") if orientation == "vertical"
    {
      class: classes.join(" ")
    }
  end
end
