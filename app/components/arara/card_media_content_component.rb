module Arara
  class CardMediaContentComponent < ActionView::Component::Base
    include Arara::BaseComponent

    def initialize(**kw)
      super(tag: "div", **kw)
    end

    attr_reader :image_url, :content_html_class

    def default_html_class
      "mdc-card__media-content"
    end
  end
end
