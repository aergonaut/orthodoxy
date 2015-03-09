require "orthodoxy/engine"
require "orthodoxy/acts_as_rule_set"

module Orthodoxy
  mattr_accessor :rule_set_class

  def self.rule_set_class
    @@rule_set_class.constantize
  end
end
