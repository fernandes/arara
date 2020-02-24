module Arara
  class DialogTitleComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent
    
    def initialize(id:, **kw)
      super(tag: "h2", id: id, **kw)
    end


    def default_html_class
      "mdc-dialog__title"
    end
  end
end
