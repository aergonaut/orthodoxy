module Orthodoxy
  module HasCustomValidations
    extend ActiveSupport::Concern

    module ClassMethods
      def has_custom_validations
        validate :orthodoxy_rules_validation
        
        define_method(:orthodoxy_rules_validation) do
          Orthodoxy.rule_set_class.applicable_to(self).each do |rule_set|
            rule_set.apply_rules(self)
          end
        end
      end
    end
  end
end
