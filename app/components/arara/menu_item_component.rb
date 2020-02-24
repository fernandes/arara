class Arara::MenuItemComponent < ActionView::Component::Base
  include Arara::BaseComponent

  def initialize(**kw)
    super(tag: "li", **kw)
  end

  def default_html_class
    "mdc-list-item"
  end

  def html_options
    opts = super
    opts[:role] = "menuitem"
    opts[:tabindex] = "-1"
    opts
  end

  def content
    user_content
  end
end
