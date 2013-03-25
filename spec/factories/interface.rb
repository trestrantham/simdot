FactoryGirl.define do
  factory :interface do
    association :to_system, factory: :system
    association :from_system, factory: :system
  end
end
