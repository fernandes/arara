module Arara
  class ElevationComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent
    
    attr_reader :depth

    def initialize(depth:, **kw)
      super(tag: "div", depth: depth, **kw)

      @depth = depth
    end

    def default_html_class
      "mdc-elevation--z#{depth}"
    end
  end
end
