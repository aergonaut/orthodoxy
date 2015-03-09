FactoryGirl.define do
  factory :rule, class: Orthodoxy::Rule do
    field_name "test_field"

    factory :presence_rule do
      validator_class "ActiveModel::Validations::PresenceValidator"
    end
  end
end
