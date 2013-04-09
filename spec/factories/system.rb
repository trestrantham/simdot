FactoryGirl.define do
  factory :system do
    name { "System #{Faker::Company.bs}" }
  end
end
