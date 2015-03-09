require 'rails_helper'

module Orthodoxy
  RSpec.describe HasCustomValidations do
    subject(:entry) { Entry.new }

    describe "#orthodoxy_rules_validation" do
      it { is_expected.to respond_to(:orthodoxy_rules_validation) }

      it "is called on validation" do
        expect(entry).to receive(:orthodoxy_rules_validation)
        entry.valid?
      end
    end
  end
end
