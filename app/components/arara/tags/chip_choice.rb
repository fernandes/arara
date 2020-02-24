# frozen_string_literal: true

require "action_view/helpers/tags/checkable"

module Arara
  module Tags # :nodoc:
    class ChipChoice < ActionView::Helpers::Tags::Base # :nodoc:
      def initialize(object_name, method_name, template_object, checked_value, unchecked_value, options)
        @checked_value   = checked_value
        @unchecked_value = unchecked_value
        super(object_name, method_name, template_object, options)
      end

      def render
        options = @options.stringify_keys
        options["type"]     = "checkbox"
        options["value"]    = @checked_value
        options["checked"] = "checked" if input_checked?(options)
        options["selected"] = !!options["checked"]

        if options["multiple"]
          add_default_name_and_id_for_value(@checked_value, options)
          options.delete("multiple")
        else
          add_default_name_and_id(options)
        end

        include_hidden = options.delete("include_hidden") { true }

        options["data"] ||= {}
        options["data"]["rails-chip-set-filter-target"] = "rails-chip-set-filter.#{options["id"].camelize(:lower)}"
        checkbox = @template_object.template.render(Arara::ChipComponent, options.symbolize_keys)

        if include_hidden
          hidden = hidden_field_for_checkbox(options)
          hidden + checkbox
        else
          checkbox
        end
      end

      private
        def input_checked?(options)
          if options.has_key?("checked")
            checked = options.delete "checked"
            checked == true || checked == "checked"
          else
            checked?(value_before_type_cast)
          end
        end

        def checked?(value)
          case value
          when TrueClass, FalseClass
            value == !!@checked_value
          when NilClass
            false
          when String
            value == @checked_value
          else
            if value.respond_to?(:include?)
              value.include?(@checked_value)
            else
              value.to_i == @checked_value.to_i
            end
          end
        end

        def hidden_field_for_checkbox(options)
          value = options["selected"] ? options["value"] : "0"
          tag(
            "input", options.slice("name", "disabled", "form").
              merge!(
                "type" => "hidden", "value" => value,
                "data": { "target": "rails-chip-set-filter.#{options["id"].camelize(:lower)}"
              })
          )
        end
    end
  end
end
