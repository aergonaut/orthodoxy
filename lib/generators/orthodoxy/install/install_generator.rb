module Orthodoxy
  class InstallGenerator < ::Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def copy_initilizer_file
      copy_file "initializer.rb", "config/initializers/orthodoxy.rb"
    end

    def copy_migrations
      rake "orthodoxy:install:migrations"
    end
  end
end
