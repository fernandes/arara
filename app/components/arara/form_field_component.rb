module Arara
  class FormFieldComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(**kw)
      super(tag: "div", **kw)
    end

    def default_html_class
      "mdc-form-field"
    end
  end
end
