module Orthodoxy
  class Engine < ::Rails::Engine
    isolate_namespace Orthodoxy

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
