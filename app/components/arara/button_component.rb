module Arara
  class ButtonComponent < ActionView::Component::Base
    include Arara::BaseComponent
    attr_reader :type, :name, :value

    def initialize(variant: "text", content: "Label", dense: false, icon: nil, type: nil, name: nil, value: nil, tag: "button", **kw)
      @dense = dense
      @icon = icon
      @html_class = html_class
      @type = type
      @name = name
      @value = value
      super(tag: tag, variant: variant, content: content, **kw)
    end

    # private
      attr_reader :icon, :data
  
      def html_class
        klass = ["mdc-button"]
        klass.push("mdc-button--dense") if @dense
        klass.push("mdc-button--raised") if @user_variant == "raised"
        klass.push("mdc-button--unelevated") if @user_variant == "unelevated"
        klass.push("mdc-button--outlined") if @user_variant == "outlined"
        klass.push("#{@html_class}") if @html_class
        klass
      end

      def has_icon?
        @icon.present?
      end

      def default_data_controller
        "mdc-ripple"
      end

      def html_options
        opts = super
        opts.merge!(
          class: html_class, data: html_data, type: type, name: name, value: value
        )
      end

      def html_content
        return content if content
        return value if value
        user_content
      end
  end
end
