require 'spec_helper'

describe Context do
  it "has a valid factory" do
    expect(create(:context)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:context, name: nil)).to_not be_valid
  end

  it "has a unique name" do
    context = create(:context)
    expect(build(:context, name: context.name)).to_not be_valid
  end

  describe "#categories" do
    it "responds to zero Categories" do
      context = create(:context)
      expect(context.categories).to be_empty
    end

    it "responds to one or more Categories" do
      context = create(:context)
      category = create(:category, context: context)
      expect(context.categories.first).to eq(category)
    end
  end
end
