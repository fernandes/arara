module Arara
  class DialogFooterComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent
    
    def initialize(**kw)
      super(tag: "footer", id: id, **kw)
    end

    def default_html_class
      "mdc-dialog__actions"
    end
  end
end
