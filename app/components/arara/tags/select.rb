# frozen_string_literal: true

module Arara
  module Tags # :nodoc:
    class Select < ActionView::Helpers::Tags::Base # :nodoc:
      def initialize(object_name, method_name, template_object, choices, options, html_options)
        @choices = block_given? ? template_object.capture { yield || "" } : choices
        @choices = @choices.to_a if @choices.is_a?(Range)

        @html_options = html_options

        super(object_name, method_name, template_object, options)
      end

      def render
        option_tags_options = {
          selected: @options.fetch(:selected) { value.to_s },
          disabled: @options[:disabled]
        }

        option_tags = if grouped_choices?
          grouped_options_for_select(@choices, option_tags_options)
        else
          options_for_select(@choices, option_tags_options)
        end

        if option_tags_options[:selected]
           selected_element = @choices.select { |x| x[1].to_s == option_tags_options[:selected] }.first
           if selected_element
            selected_label = selected_element[0].to_s
            selected_value = selected_element[1].to_s
           end
           @options.merge!(
             selected_value: selected_value,
             selected_label: selected_label,
           )
        end

        select_content_tag(option_tags, @options, @html_options)
      end

      # def render
      #   option_tags_options = {
      #     selected: @options.fetch(:selected) { value.to_s },
      #     disabled: @options[:disabled]
      #   }

      #   option_tags = if grouped_choices?
      #     grouped_options_for_select(@choices, option_tags_options)
      #   else
      #     options_for_select(@choices, option_tags_options)
      #   end

      #   # select_content_tag(option_tags, @options, @html_options)

      #   @options.merge!(@html_options)
      #   @template_object.template.render(SelectComponent, @options.symbolize_keys) do
      #     option_tags
      #   end
      # end

      # my method
      def options_for_select(container, selected = nil)
        return container if String === container

        selected, disabled = extract_selected_and_disabled(selected).map do |r|
          Array(r).map(&:to_s)
        end

        container.map do |element|
          html_attributes = option_html_attributes(element)
          text, value = option_text_and_value(element).map(&:to_s)

          html_attributes[:selected] ||= option_value_selected?(value, selected)
          html_attributes[:disabled] ||= disabled && option_value_selected?(value, disabled)
          html_attributes[:value] = value

          # also set the label
          html_attributes[:label] = text

          # and render our component
          @template_object.template.render(Arara::SelectItemComponent, html_attributes.symbolize_keys)
        end.join("\n").html_safe
      end

      def select_content_tag(option_tags, options, html_options)
        html_options = html_options.stringify_keys
        add_default_name_and_id(html_options)
        
        if placeholder_required?(html_options)
          raise ArgumentError, "include_blank cannot be false for a required field." if options[:include_blank] == false
          options[:include_blank] ||= true unless options[:prompt]
        end
        
        value = options.fetch(:selected) { value() }
        select = content_tag("select", add_options(option_tags, options, value), html_options)
        
        if html_options["multiple"] && options.fetch(:include_hidden, true)
          tag("input", disabled: html_options["disabled"], name: html_options["name"], type: "hidden", value: "") + select
        else
          select
        end

        select_options = options.merge(html_options)
        @template_object.template.render(Arara::SelectComponent, select_options.symbolize_keys) do
          option_tags
        end
      end

      private
        # Grouped choices look like this:
        #
        #   [nil, []]
        #   { nil => [] }
        def grouped_choices?
          !@choices.blank? && @choices.first.respond_to?(:last) && Array === @choices.first.last
        end
    end
  end
end
