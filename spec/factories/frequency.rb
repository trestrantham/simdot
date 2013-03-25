FactoryGirl.define do
  factory :frequency do
    sequence(:name) { |n| "Frequency #{n}" }
  end
end
