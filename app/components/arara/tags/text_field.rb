# frozen_string_literal: true

require "action_view/helpers/tags/placeholderable"

module Arara
  module Tags # :nodoc:
    class TextField < ActionView::Helpers::Tags::Base # :nodoc:
      include ActionView::Helpers::Tags::Placeholderable

      def render
        options = @options.stringify_keys
        options["size"] = options["maxlength"] unless options.key?("size")
        options["type"] ||= field_type
        options["value"] = options.fetch("value") { value_before_type_cast } unless field_type == "file"
        add_default_name_and_id(options)
        @template_object.template.render(Arara::TextFieldComponent, options.symbolize_keys)
      end

      class << self
        def field_type
          @field_type ||= name.split("::").last.sub("Field", "").downcase
        end
      end

      private
        def field_type
          self.class.field_type
        end
    end
  end
end
