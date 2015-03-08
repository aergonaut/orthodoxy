require 'rails_helper'
require 'support/dummy_record'

module Orthodoxy
  RSpec.describe Rule, type: :model do
    subject(:rule) { FactoryGirl.build :rule }
    
    it { is_expected.to validate_presence_of :field_name }
    it { is_expected.to validate_presence_of :validator_class }
    it { is_expected.to serialize :validator_options }

    describe "#validate" do
      let(:record) { DummyRecord.new }
      let(:rule) { FactoryGirl.build :rule, validator_class: "ActiveModel::Validations::PresenceValidator", field_name: "test_field" }
      
      context "when the record does not pass the validation rule" do
        before do
          record.test_field = nil
          rule.validate(record)
        end
        
        it "marks the record invalid" do
          expect(record.errors).to have_key(:test_field)
        end
      end

      context "when the record does pass the validation rule" do
        before do
          record.test_field = "something"
          rule.validate(record)
        end
        
        it "marks the record invalid" do
          expect(record.errors).not_to have_key(:test_field)
        end
      end
    end
  end
end
