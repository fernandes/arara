module Arara
  class FabIconComponent < ActionView::Component::Base
    include Arara::BaseComponent
    validates :content, presence: true

    def initialize(icon:, **kw)
      super(tag: "i", **kw)
      @icon = icon
    end

    def default_html_class
      "material-icons"
    end
  end
end
