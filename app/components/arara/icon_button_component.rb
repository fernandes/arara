module Arara
  class IconButtonComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true
    attr_reader :title, :pressed

    def initialize(title: nil, pressed: nil, **kw)
      super(tag: "button", **kw)
      @title = title
      @pressed = pressed
    end

    def default_html_class
      'mdc-icon-button'
    end

    def aria_data
      data = {}
      data[:label] = title if title
      data[:pressed] = pressed unless pressed.nil?
      data
    end

    def html_options
      opts = super
      opts.merge!(title: title) if title
      opts.merge!(aria: aria_data)
      opts
    end

    def html_data
      data = super
      data.merge!('mdc-ripple-is-unbounded' => "")
      data
    end

    def default_data_controller
      "mdc-ripple"
    end
  end
end
