module Arara
  class DataTableBodyRowComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :selected

    validates :content, presence: true

    def initialize(selected: false, **kw)
      super(tag: "tr", **kw)
      @selected = selected
    end

    def default_html_class
      return "mdc-data-table__row mdc-data-table__row--selected" if selected
      "mdc-data-table__row"
    end

    def html_options
      opts = super
      if selected
        opts[:aria] = {} unless opts.has_key?(:aria)
        opts[:aria][:selected] = true
      end
      opts
    end
  end
end
