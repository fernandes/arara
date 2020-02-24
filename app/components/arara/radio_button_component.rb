module Arara
  class RadioButtonComponent < ActionView::Component::Base
    include Arara::BaseComponent
    
    attr_reader :id, :name, :checked, :value, :type

    def initialize(id:, name:, value:, checked: false, type: "radio", **kw)
      @id = id
      @name = name
      @checked = checked
      @value = value
      @type = type

      super(tag: "div", **kw)
    end

    def html_input_options
      opts = {
        class: "mdc-radio__native-control",
        type: type,
        id: id,
        name: name,
        value: value
      }

      opts[:checked] = "" if checked

      opts
    end

    def default_html_class
      "mdc-radio"
    end
  end
end
