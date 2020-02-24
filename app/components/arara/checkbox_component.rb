module Arara
  class CheckboxComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :id, :name, :value, :checked, :indeterminate

    def initialize(id:, name:, value: 1, checked: false, indeterminate: false, **kw)
      super(tag: "div", **kw)
      @checked = checked
      @indeterminate = indeterminate
      @id = id
      @name = name
      @value = value
    end

    def html_data
      data = super
      data.merge!(checked: checked, indeterminate: indeterminate)
      data
    end

    def default_html_class
      'mdc-checkbox'
    end
  end
end
