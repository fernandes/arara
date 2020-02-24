module Arara
  class FabComponent < ActionView::Component::Base
    class InvalidVariant < StandardError; end

    include Arara::BaseComponent
    VALID_VARIANTS = %w(default mini extended extended_no_icon)

    attr_reader :label, :extended_label, :label_before
    with_options if: -> { user_variant == "extended" } do |extended|
      extended.validates :content, presence: true
      extended.validates :extended_label, presence: true
    end

    def initialize(variant: "default", label:, extended_label: nil, label_before: false, **kw)
      raise InvalidVariant.new("`#{variant}' is not a valid variant") unless VALID_VARIANTS.include?(variant.to_s)
      super(tag: "button", variant: variant, **kw)

      @variant = variant
      @label = label
      @extended_label = extended_label
      @label_before = label_before
    end

    def default_html_class
      return "mdc-fab mdc-fab--mini" if user_variant == "mini"
      return "mdc-fab mdc-fab--extended" if user_variant == "extended"
      return "mdc-fab mdc-fab--extended" if user_variant == "extended_no_icon"
      "mdc-fab"
    end

    def html_options
      opts = super
      opts[:aria] = {} unless opts.has_key?(:aria)
      opts[:aria][:label] = label
      opts
    end

    def default_data_controller
      "mdc-ripple"
    end
  end
end
