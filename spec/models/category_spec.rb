require 'spec_helper'

describe Category do
  it "has a valid factory" do
    expect(create(:category)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:category, name: nil)).to_not be_valid
  end

  it "is invalid without a context" do
    expect(build(:category, context_id: nil)).to_not be_valid
  end

  describe "#name" do
    it "has a unique name for a given Context" do
      category = create(:category)
      expect(build(:category, name: category.name, context: category.context)).to_not be_valid
    end

    it "allows a duplicate name for a separate Context" do
      context1 = create(:context, name: "Foo")
      context2 = create(:context, name: "Bar")
      category = create(:category, context: context1)
      expect(build(:category, name: category.name, context: context2)).to be_valid
    end
  end
end
