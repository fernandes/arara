class Arara::GoogleCalendar::MenuItemComponent < ActionView::Component::Base

  def initialize(icon:, title:, count: nil, active: false)
    @icon = icon
    @title = title
    @count = count
    @active = active
  end

  private
    attr_reader :icon, :title, :count, :active

    def background_color
      return "#e8f0fe" if active
      "inherit"
    end

    def icon_color
      return "#1a73e8" if active
      "#616161"
    end

    def text_color
      return "#1a73e8" if active
      "#202124"
    end

    def html_class
      klass = "nav_bar__menu_item"
      klass << " nav_bar__menu_item--active" if active
      klass
    end

end
