module Refinery
  module Contents
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Contents

      engine_name :refinery_contents

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contents"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contents_admin_contents_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Contents)
      end
    end
  end
end
