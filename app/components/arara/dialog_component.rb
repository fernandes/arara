module Arara
  class DialogComponent < ActionView::Component::Base
    validates :content, presence: true

    include Arara::BaseComponent
    
    attr_reader :role, :labelledby, :describedby

    def initialize(role: "alertdialog", labelledby:, describedby:, **kw)
      super(tag: "div", role: role, **kw)

      @role = role
      @labelledby = labelledby
      @describedby = describedby
    end


    def default_html_class
      "mdc-dialog"
    end

    def surface_options
      opts = {
        class: "mdc-dialog__surface",
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
