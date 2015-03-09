require 'rails_helper'
require 'support/dummy_record'

module Orthodoxy
  RSpec.describe ActsAsRuleSet do
    subject(:rule_set) { Ruleset.create! }

    let!(:rule_1) { FactoryGirl.create :presence_rule, rule_set: rule_set }

    it { is_expected.to have_many :rules }
    it { is_expected.to respond_to(:applicable_to?) }

    describe "#apply_rules" do
      let(:record) { DummyRecord.new }

      before do
        record.test_field = nil
        rule_set.rules = [rule_1]
      end

      it "calls validate on each of its rules" do
        expect(rule_1).to receive(:validate)
        rule_set.apply_rules(record)
      end
    end
  end
end
