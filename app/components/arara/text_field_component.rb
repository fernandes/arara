module Arara
  class TextFieldComponent < ActionView::Component::Base
    include Arara::BaseComponent
    
    attr_reader :label, :id, :name, :value, :textarea, :full_width, :helper_text, :type

    with_content_areas :leading_icon, :trailing_icon, :max_length

    def initialize(variant: "default", label: nil, helper_text: nil, max_length: nil, textarea: false, id:, name: nil, value: nil, full_width: false, has_error: false, type: "text", **kw)
      super(tag: "div", variant: variant, **kw)

      @label = label
      @helper_text = helper_text
      @max_length = max_length
      @textarea = textarea
      @id = id
      @name = name
      @value = value
      @full_width = full_width
      @has_error = has_error
      @user_variant = "outlined" if textarea
      @type = type
    end

    def has_error?
      @has_error
    end

    def default_html_class
      classes = ["mdc-text-field"]
      classes << "mdc-text-field--fullwidth" if full_width
      classes << "mdc-text-field--textarea" if is_textarea?
      classes << "mdc-text-field--error" if has_error?
      classes << "mdc-text-field--outlined" if user_variant == "outlined"
      classes.join(" ")
    end

    def html_options
      opts = super
      opts.deep_symbolize_keys!
      opts[:data] = opts.has_key?(:data) ? opts[:data] : {}
      opts[:data][:target] = opts[:data].has_key?(:target) ? opts[:data][:target] : ""
      opts[:data][:target].concat(" #{data_controller}.element")
      opts
    end

    def html_input_tag
      return "textarea" if textarea
      "input"
    end
    
    def html_input_options
      opts = {
        class: "mdc-text-field__input",
        id: id,
        type: type,
        aria: {
          labelledby: "#{id}-label",
          controls: "#{id}-helper",
          describedby: "#{id}-helper"
        }
      }
      opts.merge!(name: name) if name
      opts.merge!(value: value) if value
      opts[:data] = opts.has_key?(:data) ? opts[:data] : {}
      opts[:data][:action] = "focusin->#{data_controller}#handleFocus"
      opts.merge!(placeholder: label) if full_width && !is_textarea?
      # opts.merge!(rows: 4, cols: 40) if textarea
      opts.merge!(maxlength: max_length) if max_length
      opts
    end

    def helper_line_class
      classes = ["mdc-text-field-helper-line"]
      classes << "mdc-text-field-helper-line--error" if has_error?
      classes.join(" ")
    end

    def helper_text_class
      classes = ["mdc-text-field-helper-text mdc-text-field-helper-text--persistent mdc-text-field-helper-text--validation-msg"]
      classes.join(" ")
    end

    def default_data_controller
      "mdc-text-field"
      nil
    end

    def data_controller
      "mdc-text-field"
    end

    def is_outlined?
      user_variant == "outlined" && is_textarea?
    end

    def is_textarea?
      textarea
    end
  end
end
