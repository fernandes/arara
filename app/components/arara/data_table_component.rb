module Arara
  class DataTableComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :label

    validates :content, presence: true

    def initialize(label: nil, **kw)
      super(tag: "div", **kw)
      @label = label
    end

    def default_html_class
      "mdc-data-table"
    end

    def default_data_controller
      "mdc-data-table"
    end

    def table_tag
      "table"
    end

    def table_options
      opts = {
        class: "mdc-data-table__table"
      }
      unless label.empty?
        opts[:aria] ||= {}
        opts[:aria][:label] = label
      end
      opts
    end
  end
end
