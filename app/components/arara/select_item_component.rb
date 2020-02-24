module Arara
  class SelectItemComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :value, :label, :blank, :selected, :disabled

    with_options if: -> { blank == false } do |extended|
      extended.validates :value, presence: true
      extended.validates :label, presence: true
    end

    def initialize(value: nil, label: nil, blank: false, selected: false, disabled: false, **kw)
      super(tag: "li", **kw)

      @value = value
      @label = label
      @blank = blank
      @disabled = disabled
      @selected = selected
      if blank
        @value = ""
        label = nil
      end
    end

    def default_html_class
      return "mdc-list-item mdc-list-item--selected" if selected
      "mdc-list-item"
    end

    def html_options
      opts = super

      opts[:data] ||= {}
      opts[:aria] ||= {}

      opts[:role] = "option"
      opts[:aria][:selected] = selected
      opts[:tabindex] = "-1"
      opts[:data][:value] = value

      opts[:disabled] = "" if disabled
      opts
    end
  end
end
