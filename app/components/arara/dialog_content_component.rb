module Arara
  class DialogContentComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent
    
    def initialize(id:, **kw)
      super(tag: "div", id: id, **kw)
    end

    def default_html_class
      "mdc-dialog__content"
    end
  end
end
