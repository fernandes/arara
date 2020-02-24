# frozen_string_literal: true

require "action_view/helpers/tags/placeholderable"

module Arara
  module Tags # :nodoc:
    class Chipset < ActionView::Helpers::Tags::Base # :nodoc:
      attr_reader :block
      include ActionView::Helpers::Tags::Placeholderable

      def initialize(object_name, method_name, template_object, options = {}, &block)
        @block = block
        super
      end

      def render
        options = @options.stringify_keys
        options["value"] = options.fetch("value") { value_before_type_cast } unless field_type == "file"
        if options["variant"] == :choice
          options["include_choice_hidden_field"] = true
        end
        add_default_name_and_id(options)

        @template_object.template.render(Arara::ChipsetComponent, options.symbolize_keys, &block)
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
