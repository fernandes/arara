module Arara
  class ChipsetComponent < ActionView::Component::Base
    include Arara::BaseComponent

    validates :content, presence: true

    def initialize(variant: "", selected_chip_ids: [], **kw)
      @variant = variant
      @selected_chip_ids = selected_chip_ids
      super(tag: "div", variant: variant, **kw)
    end

    def default_data_controller
      "mdc-chip-set"
    end

    def default_html_class
      return "mdc-chip-set mdc-chip-set--choice" if user_variant == "choice"
      return "mdc-chip-set mdc-chip-set--filter" if user_variant == "filter"
      "mdc-chip-set"
    end
  end
end
