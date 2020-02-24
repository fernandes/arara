module Arara
  module BaseComponent
    class MissingTag < StandardError; end

    def self.included(mod)
      attr_reader :user_content, :user_variant, :user_tag, :user_data, :id, :options

      def initialize(tag: nil, content: nil, variant: nil, id: nil, data: nil, **options)
        @user_tag = tag.try(:to_s) || default_html_tag
        @user_variant = variant.try(:to_s)
        @user_content = content
        @user_data = data || {}
        @html_class = options.fetch(:class, "")
        @options = options
        @id = id
      end
    
      def html_content
        return content if content
        user_content
      end
    
      def html_class
        classes = default_html_class ? [default_html_class] : []
        classes.push(@html_class) unless @html_class.try(:empty?)
        classes.empty? ? [] : classes
      end
    
      def html_tag
        raise MissingTag.new('You need to specify a tag') if @user_tag.nil?
        @user_tag
      end
    
      def html_options
        opts = options.dup
        opts[:class] = html_class unless html_class.empty?
        opts[:data] = html_data unless html_data.empty?
        opts[:id] = id if id
        opts
      end
    
      def html_data
        data_controller = default_data_controller ? [default_data_controller] : []
        data_controller.push(user_data[:controller]) if user_data.has_key?(:controller)
        data_controller = (data_controller.empty? ? nil : data_controller.join(" "))
    
        data = user_data.dup
        data.merge!({controller: data_controller})
        data
      end
    
      def default_data_controller
      end
    
      def default_html_class
      end

      def default_html_tag
      end
    end
  end
end
