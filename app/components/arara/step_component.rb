class Arara::StepComponent < ActionView::Component::Base
  include Arara::BaseComponent
  attr_reader :title, :sub_title, :orientation, :alternative_label, :active, :completed, :disabled, :editable, :link, :order, :connector

  def initialize(title: "", sub_title: nil, orientation: "horizontal", alternative_label: false, active: false, completed: false, disabled: false, editable: false, link: nil, order: 0, connector: false, **kw)
    @orientation = orientation
    @alternative_label = alternative_label
    @active = active
    @completed = completed
    @disabled = disabled
    @editable = editable
    @link = link
    @title = title
    @sub_title = sub_title
    @order = order
    @connector = connector
    super(tag: "div", **kw)
  end

  def default_html_class
    classes = %w(MuiStep-root)
    classes.push("MuiStep-horizontal") if orientation == "horizontal"
    classes.push("MuiStep-vertical") if orientation == "vertical"
    classes.push("MuiStep-alternativeLabel") if alternative_label
    classes.push("MuiStep-completed") if completed
    classes.join(" ")
  end

  def label_root_options
    classes = %w(MuiStepLabel-root)
    classes.push("MuiStepLabel-horizontal") if orientation == "horizontal"
    classes.push("MuiStepLabel-vertical") if orientation == "vertical"
    classes.push("MuiStepLabel-alternativeLabel") if alternative_label
    {
      class: classes.join(" ")
    }
  end

  def icon_container_options
    classes = %w(MuiStepLabel-iconContainer)
    classes.push("MuiStepLabel-alternativeLabel") if alternative_label
    {
      class: classes.join(" "),
    }
  end

  def icon_options
    classes = %w(MuiSvgIcon-root MuiStepIcon-root)
    classes.push("MuiStepIcon-completed") if completed
    classes.push("MuiStepIcon-active") if active
    {
      class: classes.join(" "),
      focusable: false,
      'view-box': "0 0 24 24",
      'aria-hidden': true,
      role: "presentation"
    }
  end

  def icon_tag
    if completed
      return content_tag(:path, nil, d: "M12 0a12 12 0 1 0 0 24 12 12 0 0 0 0-24zm-2 17l-5-5 1.4-1.4 3.6 3.6 7.6-7.6L19 8l-9 9z")
    end

    content_tag(:circle, nil, cx: 12, cy: 12, r: 12) + 
    content_tag(:text, order, class: "MuiStepIcon-text", x: "12", y: "16", 'text-anchor': "middle")
  end

  def step_label_options
    classes = %w(MuiTypography-root MuiStepLabel-label)
    classes.push('MuiStepLabel-alternativeLabel') if alternative_label
    classes.push('MuiStepLabel-completed') if completed
    classes.push('MuiStepLabel-active') if active
    classes.push('MuiTypography-body2 MuiTypography-displayBlock')
    { class: classes.join(" ") }
  end

  def has_connector?
    connector
  end

  def connector_root_options
    classes = %w(MuiStepConnector-root)
    classes.push('MuiStepConnector-horizontal') if orientation == "horizontal"
    classes.push('MuiStepConnector-vertical') if orientation == "vertical"
    classes.push('MuiStepConnector-alternativeLabel') if alternative_label
    classes.push('MuiStepConnector-active')
    { class: classes.join(" ") }
  end

  def connector_line_options
    classes = %w(MuiStepConnector-line)
    classes.push('MuiStepConnector-lineHorizontal') if orientation == "horizontal"
    { class: classes.join(" ") }
  end

  def has_vertical_content?
    orientation == "vertical" && active && !html_content.empty?
  end
end
