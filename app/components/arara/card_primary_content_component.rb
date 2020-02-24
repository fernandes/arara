module Arara
  class CardPrimaryContentComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(tabindex: 0, **kw)
      super(tag: "div", **kw)
      @tabindex = tabindex
    end

    attr_reader :tabindex

    def default_html_class
      "mdc-card__primary-action"
    end
  end
end
