module Arara
  class DataTableHeaderCellComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :numeric

    validates :content, presence: true

    def initialize(numeric: false, **kw)
      super(tag: "th", **kw)
      @numeric = numeric
    end

    def default_html_class
      return "mdc-data-table__header-cell mdc-data-table__header-cell--numeric" if numeric
      "mdc-data-table__header-cell"
    end

    def html_options
      opts = super
      opts.merge!(role: "columnheader", scope: "col")
      opts
    end
  end
end
