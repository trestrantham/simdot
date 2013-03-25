FactoryGirl.define do
  factory :dataset do
    sequence(:name) { |n| "Dataset #{n}" }
    description "Dataset Description"
  end
end
