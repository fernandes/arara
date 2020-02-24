module Arara
  class ChipComponent < ActionView::Component::Base
    include Arara::BaseComponent

    with_content_areas :leading_icon, :trailing_icon

    def initialize(id:, label:, variant: "choice", selected: false, should_remove_on_trailing_icon_click: false, **kw)
      @id = id
      @label = label
      @selected = selected
      @should_remove_on_trailing_icon_click = should_remove_on_trailing_icon_click
      super(tag: "div", variant: variant, **kw)
    end

    attr_reader :id, :label, :selected, :user_variant

    def default_html_class
      return "mdc-chip mdc-chip--selected" if selected
      "mdc-chip"
    end
  end
end
