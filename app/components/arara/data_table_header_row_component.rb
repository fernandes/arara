module Arara
  class DataTableHeaderRowComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(**kw)
      super(tag: "tr", **kw)
    end

    def default_html_class
      "mdc-data-table__header-row"
    end
  end
end
