require "orthodoxy/acts_as_rule_set"
require "orthodoxy/has_custom_validations"
require "orthodoxy/engine"

module Orthodoxy
  mattr_accessor :rule_set_class
  mattr_accessor :validator_classes

  def self.rule_set_class
    @@rule_set_class.constantize
  end

  def self.validator_classes
    @@validator_classes ||= [
      "ActiveModel::Validations::PresenceValidator",
      "ActiveModel::Validations::AbsenceValidator",
      "ActiveModel::Validations::LengthValidator",
      "ActiveModel::Validations::FormatValidator",
      "ActiveModel::Validations::NumericalityValidator",
      "ActiveModel::Validations::InclusionValidator",
      "ActiveModel::Validations::ExclusionValidator"
    ]
  end
end
