require "orthodoxy/acts_as_rule_set"
require "orthodoxy/has_custom_validations"
require "orthodoxy/engine"

module Orthodoxy
  mattr_accessor :rule_set_class

  def self.rule_set_class
    @@rule_set_class.constantize
  end
end
