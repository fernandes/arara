module Arara
  class CardActionButtonsComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(**kw)
      super(tag: "div", **kw)
    end

    def default_html_class
      "mdc-card__action-buttons"
    end
  end
end
