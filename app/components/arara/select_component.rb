module Arara
  class SelectComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :label, :id, :name, :selected_value, :selected_label

    validates :content, presence: true

    def initialize(variant: "default", id: nil, name: nil, label:, selected_value: nil, selected_label: nil, **kw)
      super(tag: "div", variant: variant, **kw)

      @id = id
      @name = name
      @label = label
      @selected_value = selected_value
      @selected_label = selected_label
    end

    def default_data_controller
      "mdc-select"
    end

    def default_html_class
      return "mdc-select mdc-select--outlined" if user_variant == "outlined"
      "mdc-select"
    end
  end
end
