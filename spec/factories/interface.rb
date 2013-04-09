FactoryGirl.define do
  factory :interface do
    association :source_system, factory: :system
    association :target_system, factory: :system
  end
end
