# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :context do
    sequence(:name) { |n| "Context #{n}" }
  end
end
