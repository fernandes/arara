# frozen_string_literal: true

require "action_view/helpers/tags/placeholderable"

module Arara
  module Tags # :nodoc:
    class PasswordField < TextField # :nodoc:
      include ActionView::Helpers::Tags::Placeholderable

      def render
        @options = { value: nil }.merge!(@options)
        super
      end
    end
  end
end
