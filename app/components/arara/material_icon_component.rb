module Arara
  class MaterialIconComponent < ActionView::Component::Base
    include Arara::BaseComponent

    def initialize(icon:, **kw)
      super(tag: "i", **kw)
      @icon = icon
    end

    def default_html_class
      "material-icons"
    end

    def content
      @icon
    end
  end
end
