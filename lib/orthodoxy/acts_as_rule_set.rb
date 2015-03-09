module Orthodoxy
  module ActsAsRuleSet
    extend ActiveSupport::Concern

    included do
      has_many :rules, class_name: "Orthodoxy::Rule", foreign_key: "rule_set_id"
    end

    def applicable_to?(record)
      true
    end
    
    def apply_rules(record)
      self.rules.each do |rule|
        rule.validate(record)
      end
    end

    module ClassMethods
      def applicable_to(record)
        self.all
      end
    end
  end
end
