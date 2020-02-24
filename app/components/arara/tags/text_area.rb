# frozen_string_literal: true

require "action_view/helpers/tags/placeholderable"

module Arara
  module Tags # :nodoc:
    class TextArea < ActionView::Helpers::Tags::Base # :nodoc:
      include ActionView::Helpers::Tags::Placeholderable

      def render
        options = @options.stringify_keys
        add_default_name_and_id(options)

        if size = options.delete("size")
          options["cols"], options["rows"] = size.split("x") if size.respond_to?(:split)
        end

        options["textarea"] = true
        options["value"] = options.delete("value") { value_before_type_cast }

        @template_object.template.render(Arara::TextFieldComponent, options.symbolize_keys)
      end
    end
  end
end
