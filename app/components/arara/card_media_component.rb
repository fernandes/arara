module Arara
  class CardMediaComponent < ActionView::Component::Base
    include Arara::BaseComponent

    def initialize(variant:, image_url:, content_html_class: "", **kw)
      super(tag: "div", variant: variant, **kw)

      @image_url = image_url
      @content_html_class = content_html_class
    end

    attr_reader :image_url, :content_html_class

    def default_html_class
      return "mdc-card__media mdc-card__media--16-9" if user_variant == "wide"
      return "mdc-card__media mdc-card__media--square" if user_variant == "square"
      "mdc-card__media"
    end
  end
end
