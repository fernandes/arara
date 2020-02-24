module Arara
  class DataTableBodyCellComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :numeric

    validates :content, presence: true

    def initialize(numeric: false, **kw)
      super(tag: "td", **kw)
      @numeric = numeric
    end

    def default_html_class
      return "mdc-data-table__cell mdc-data-table__cell--numeric" if numeric
      "mdc-data-table__cell"
    end
  end
end
