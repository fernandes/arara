require 'action_view/component/railtie'

module Arara
  class Engine < ::Rails::Engine
    isolate_namespace Arara
  end
end
