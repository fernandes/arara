module Arara
  class DataTableHeaderComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(**kw)
      super(tag: "thead", **kw)
    end
  end
end
