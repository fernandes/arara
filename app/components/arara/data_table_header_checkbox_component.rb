module Arara
  class DataTableHeaderCheckboxComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :selected, :label

    def initialize(selected: false, label:, **kw)
      super(tag: "th", **kw)
      @selected = selected
      @label = label
    end

    def default_html_class
      "mdc-data-table__header-cell mdc-data-table__header-cell--checkbox"
    end

    def html_options
      super.merge!({role: "columnheader", scope: "col"})
    end

    def checkbox_class
      return "mdc-checkbox mdc-data-table__header-row-checkbox mdc-checkbox--selected" if selected
      "mdc-checkbox mdc-data-table__header-row-checkbox"
    end
  end
end
