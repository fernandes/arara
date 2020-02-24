module Arara
  class TypographyComponent < ActionView::Component::Base
    VALID_VARIANTS = %w(h1 h2 h3 h4 h5 h6 sub1 sub2 body1 body2 button caption overline)
    class InvalidVariant < StandardError; end

    include Arara::BaseComponent

    def initialize(variant: "body1", **kw)
      raise InvalidVariant.new("`#{variant}' is not a valid variant") unless VALID_VARIANTS.include?(variant.to_s)
      super(variant: variant, **kw)
    end

    private
      def default_html_class
        return "mdc-typography mdc-typography--headline1" if user_variant == "h1"
        return "mdc-typography mdc-typography--headline2" if user_variant == "h2"
        return "mdc-typography mdc-typography--headline3" if user_variant == "h3"
        return "mdc-typography mdc-typography--headline4" if user_variant == "h4"
        return "mdc-typography mdc-typography--headline5" if user_variant == "h5"
        return "mdc-typography mdc-typography--headline6" if user_variant == "h6"
        return "mdc-typography mdc-typography--subtitle1" if user_variant == "sub1"
        return "mdc-typography mdc-typography--subtitle2" if user_variant == "sub2"
        return "mdc-typography mdc-typography--body1" if user_variant == "body1"
        return "mdc-typography mdc-typography--body2" if user_variant == "body2"
        return "mdc-typography mdc-typography--button" if user_variant == "button"
        return "mdc-typography mdc-typography--caption" if user_variant == "caption"
        return "mdc-typography mdc-typography--overline" if user_variant == "overline"
      end

      def html_tag
        return user_tag if user_tag
        return "h1" if user_variant == "h1"
        return "h2" if user_variant == "h2"
        return "h3" if user_variant == "h3"
        return "h4" if user_variant == "h4"
        return "h5" if user_variant == "h5"
        return "h6" if user_variant == "h6"
        return "h6" if user_variant == "sub1"
        return "h6" if user_variant == "sub2"
        return "p" if user_variant == "body1"
        return "p" if user_variant == "body2"
        return "span" if user_variant == "button"
        return "span" if user_variant == "caption"
        return "span" if user_variant == "overline"
      end

      def default_html_tag
        html_tag
      end
  end
end
