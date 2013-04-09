require 'spec_helper'

describe ContextMap do
  it "has a valid factory" do
    expect(create(:context_map)).to be_valid
  end

  it "is invalid without a contextable_id" do
    expect(build(:context_map, contextable_id: nil)).to_not be_valid
  end

  it "is invalid without a contextable_type" do
    expect(build(:context_map, contextable_type: nil)).to_not be_valid
  end

  it "is invalid without a context" do
    expect(build(:context_map, context_id: nil)).to_not be_valid
  end

  it "has a unique context for a given contextable" do
    system = create(:system)
    context_map = create(:context_map, contextable: system)
    expect(build(:context_map, contextable: system, context: context_map.context)).to_not be_valid
  end

  it "is valid without a category" do
    context_map = build(:context_map, category: nil)
    expect(context_map).to be_valid
    expect(context_map.category).to be_nil
  end

  it "is invalid if the category is not unique for a given contextable and context" do
    system = create(:system)
    context_map = create(:context_map_with_category, contextable: system)
    context_map2 = build(:context_map, contextable: system, context: context_map.context, category: context_map.category)
    expect(context_map2).to_not be_valid
    expect(context_map2.category).to_not be_nil
  end

  it "is valid if the category is unique for a given contextable and context" do
    system = create(:system)
    context_map = create(:context_map_with_category, contextable: system)
    expect(build(:context_map, context: context_map.context, category: context_map.category)).to be_valid
  end

  it "is invalid if the category does not belong to the given context" do
    context = create(:context)
    category = create(:category)
    expect(build(:context_map, context: context, category: category)).to_not be_valid
  end

  it "is valid if the category does belong to the given context" do
    context = create(:context)
    category = create(:category, context: context)
    expect(build(:context_map, context: context, category: category)).to be_valid
  end
end
