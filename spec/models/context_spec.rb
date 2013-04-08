require 'spec_helper'

describe Context do
  it "has a valid factory" do
    create(:context).should be_valid
  end

  it "is invalid without a name" do
    build(:context, name: nil).should_not be_valid
  end

  it "has a unique name" do
    context = create(:context)
    build(:context, name: context.name).should_not be_valid
  end

  describe "#categories" do
    it "responds to zero Categories" do
      context = create(:context)
      context.categories.should be_empty
    end

    it "responds to one or more Categories" do
      context = create(:context)
      category = create(:category, context: context)
      context.categories.first.should eq(category)
    end
  end
end
