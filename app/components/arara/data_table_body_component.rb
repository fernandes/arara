module Arara
  class DataTableBodyComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(**kw)
      super(tag: "tbody", **kw)
    end

    def default_html_class
      "mdc-data-table__content"
    end
  end
end
