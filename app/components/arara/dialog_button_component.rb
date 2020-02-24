module Arara
  class DialogButtonComponent < ActionView::Component::Base
    include Arara::BaseComponent
    validates :content, presence: true
    
    attr_reader :dialog_action

    def initialize(dialog_action:, **kw)
      super(tag: "button", **kw)

      @dialog_action = dialog_action
    end


    def default_html_class
      "mdc-button mdc-dialog__button"
    end

    def html_options
      opts = super
      opts.merge!({type: "button"})
      opts
    end

    def html_data
      data = super
      data.merge!('mdc-dialog-action': dialog_action)
      data
    end
  end
end
