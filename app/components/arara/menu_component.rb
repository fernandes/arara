class Arara::MenuComponent < ActionView::Component::Base
  include Arara::BaseComponent

  validates :content, presence: true

  def initialize(**kw)
    super(tag: "div", **kw)
  end

  def default_html_class
    "mdc-menu mdc-menu-surface"
  end

  def html_options
    opts = super
    opts[:tabindex] = "-1"
    opts
  end
end
