module MultitenantRoutes
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

      def copy_config_file
        template 'multitenant_routes_config.rb', 'config/initializers/multitenant_routes_config.rb'
      end
    end
  end
end