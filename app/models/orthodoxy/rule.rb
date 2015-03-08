module Orthodoxy
  class Rule < ActiveRecord::Base
    validates :field_name, presence: true
    validates :validator_class, presence: true

    serialize :validator_options, JSON

    def validate(record)
      opts = {
        attributes: [self.field_name.to_sym]
      }
      opts.merge!(self.validator_options.symbolize_keys) if self.validator_options.present?
      klass = self.validator_class.constantize
      v = klass.new(opts)
      v.validate(record)
    end
  end
end
