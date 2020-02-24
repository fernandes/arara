module Arara
  class SwitchComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :id, :checked

    def initialize(id:, checked: false, **kw)
      super(tag: "div", **kw)
      @id = id
      @checked = checked
    end

    def default_html_class
      return "mdc-switch mdc-switch--checked" if checked
      "mdc-switch"
    end

    def default_data_controller
      "mdc-switch"
    end

    def input_options
      opts = {
        type: "checkbox",
        id: id,
        class: "mdc-switch__native-control",
        role: "switch",
        aria: {
          checked: checked
        }
      }
      opts[:checked] = "" if checked
      opts
    end
  end
end
