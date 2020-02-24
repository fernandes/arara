module Arara
  class IconToggleComponent < ActionView::Component::Base

    def initialize(title:, on: false)
      @title = title
      @on = on
    end

    private
      attr_reader :title, :on

      def html_class
        classes = ['material-icons', 'mdc-icon-button__icon']
        classes << 'mdc-icon-button__icon--on' if on
        classes
      end
  end
end
