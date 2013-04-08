require 'spec_helper'

describe Category do
  it "has a valid factory" do
    create(:category).should be_valid
  end

  it "is invalid without a name" do
    build(:category, name: nil).should_not be_valid
  end

  it "is invalid without a context" do
    build(:category, context_id: nil).should_not be_valid
  end

  describe "#name" do
    it "has a unique name for a given Context" do
      category = create(:category)
      build(:category, name: category.name, context: category.context).should_not be_valid
    end

    it "allows a duplicate name for a separate Context" do
      context1 = create(:context, name: "Foo")
      context2 = create(:context, name: "Bar")
      category = create(:category, context: context1)
      build(:category, name: category.name, context: context2).should be_valid
    end
  end
end
