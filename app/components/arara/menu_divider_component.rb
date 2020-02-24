module Arara
  class MenuDividerComponent < ActionView::Component::Base
    include Arara::BaseComponent

    def initialize(**kw)
      super(tag: "hr", **kw)
    end

    def default_html_class
      "mdc-list-divider"
    end

    def html_options
      opts = super
      opts[:role] = "separator"
      opts
    end
  end
end
