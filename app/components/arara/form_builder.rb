module Arara
  class FormBuilder < ActionView::Helpers::FormBuilder
    attr_reader :template

    include ActionView::Helpers::FormTagHelper

    def label(method, options = {})
      options.deep_stringify_keys!
      super(method, options)
    end

    def chipset_choice(method, options = {}, &block)
      options.deep_stringify_keys!
      options["variant"] = :choice
      options[:data] ||= {}
      options[:data][:controller] = "rails-chip-set-choice"

      Tags::Chipset.new(object_name, method, self, objectify_options(options), &block).render
    end

    def chip_choice(method, options = {}, &block)
      options.deep_stringify_keys!
      options["variant"] = :choice

      checked_value = options[:value].to_s
      unchecked_value = 0
      options[:include_hidden] = false

      Tags::ChipChoice.new(object_name, method, self, checked_value, unchecked_value, objectify_options(options), &block).render
    end

    def chipset_filter(method, options = {}, &block)
      options.deep_stringify_keys!
      options["variant"] = :filter
      options[:data] ||= {}
      options[:data][:controller] = "rails-chip-set-filter"

      Tags::Chipset.new(object_name, method, self, objectify_options(options), &block).render
    end

    def chip_filter(method, options = {}, &block)
      options.deep_stringify_keys!
      options["variant"] = :filter

      checked_value = options[:value].to_s
      unchecked_value = 0
      options[:include_hidden] = true
      options[:multiple] = true

      Tags::ChipChoice.new(object_name, method, self, checked_value, unchecked_value, objectify_options(options), &block).render
    end

    def check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      options.deep_stringify_keys!  
      options["label"] = options.fetch("label") { build_label(method, options) }
      # options["has_error"] = has_errors_for?(method)
      # options["helper_text"] = errors_for(method).join(", ")

      Tags::CheckBox.new(object_name, method, self, checked_value, unchecked_value, objectify_options(options)).render
    end

    def text_field(method, options = {})
      options.deep_stringify_keys!
      options["label"] = options.fetch("label") { build_label(method, options) }
      options["has_error"] = has_errors_for?(method)
      options["helper_text"] ||= errors_for(method).join(", ")

      Tags::TextField.new(object_name, method, self, objectify_options(options)).render
    end

    def password_field(method, options = {})
      options.deep_stringify_keys!
      options["label"] = options.fetch("label") { build_label(method, options) }
      options["has_error"] = has_errors_for?(method)
      options["helper_text"] = errors_for(method).join(", ")
      options["type"] = "password"

      Tags::PasswordField.new(object_name, method, self, objectify_options(options)).render
    end

    def text_area(method, options = {})
      options.deep_stringify_keys!
      options["label"] = options.fetch("label") { build_label(method, options) }
      options["has_error"] = has_errors_for?(method)
      options["helper_text"] = errors_for(method).join(", ")

      Tags::TextArea.new(object_name, method, self, objectify_options(options)).render
    end

    def select(method, choices = nil, options = {}, html_options = {}, &block)
      options.deep_stringify_keys!
      options["label"] = options.fetch("label") { build_label(method, options) }

      Tags::Select.new(object_name, method, self, choices, objectify_options(options), objectify_options(html_options), &block).render
    end

    def radio_button(method, tag_value, options = {})
      options.deep_stringify_keys!
      Tags::RadioButton.new(object_name, method, self, tag_value, objectify_options(options)).render
    end

    def country_select(method, priority_or_options = {}, options = {}, html_options = {})
      options.deep_stringify_keys!
      if Hash === priority_or_options
        html_options = options
        options = priority_or_options
      else
        options[:priority_countries] = priority_or_options
      end

      options["label"] = options.fetch("label") { build_label(method, options) }
      Tags::CountrySelect.new(object_name, method, self, objectify_options(options), @default_options.merge(html_options)).render
    end

    def submit(value = nil, options = {})
      options.deep_stringify_keys!
      value, options = nil, value if value.is_a?(Hash)
      value ||= submit_default_value
      
      options = options.deep_stringify_keys
      tag_options = { "type" => "submit", "name" => "commit", "value" => value }.update(options)
      set_default_disable_with value, tag_options

      @template.render(ButtonComponent, tag_options.symbolize_keys)
    end

    private
      def build_label(method, options = {})
        tag_value = options.delete("value")
        builder = ActionView::Helpers::Tags::Label::LabelBuilder.new(self, object_name.to_s, method.to_s, nil, tag_value)
        builder.translation
      end

      def has_errors_for?(method)
        object.errors.has_key?(method)
      end

      def errors_for(method)
        object.errors[method]
      end
  end
end
