FactoryGirl.define do
  factory :context_map do
    association :contextable, factory: :system
    context

    factory :context_map_with_category do
      after(:build) do |context_map, evaluator|
        context_map.category = create(:category, context: context_map.context) unless context_map.context.nil?
      end
    end
  end
end
