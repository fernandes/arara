module Arara
  class DataTableBodyCheckboxComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :selected, :id

    def initialize(selected: false, id:, **kw)
      super(tag: "td", **kw)
      @selected = selected
      @id = id
    end

    def default_html_class
      "mdc-data-table__cell mdc-data-table__cell--checkbox"
    end

    def html_options
      super.merge!({role: "columnheader", scope: "col"})
    end

    def checkbox_class
      return "mdc-checkbox mdc-data-table__row-checkbox mdc-checkbox--selected" if selected
      "mdc-checkbox mdc-data-table__row-checkbox"
    end
  end
end
