module Arara
  class DialogComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent

    attr_reader :role, :labelledby, :describedby, :surface_class

    def initialize(role: "alertdialog", labelledby:, describedby:, surface_class: nil, **kw)
      super(tag: "div", role: role, **kw)

      @role = role
      @labelledby = labelledby
      @describedby = describedby
      @surface_class = surface_class
    end


    def default_html_class
      "mdc-dialog"
    end

    def surface_options
      {
        class: "mdc-dialog__surface #{surface_class}",
        role: role,
        aria: {
          modal: "true",
          labelledby: labelledby,
          describedby: describedby
        }
      }
    end
  end
end
