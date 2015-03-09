module Orthodoxy
  class Engine < ::Rails::Engine
    isolate_namespace Orthodoxy

    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "orthodoxy.activerecord_extensions" do
      ::ActiveRecord::Base.include Orthodoxy::HasCustomValidations
    end
  end
end
