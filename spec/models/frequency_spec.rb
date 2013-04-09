require 'spec_helper'

describe Frequency do
  it "has a valid factory" do
    expect(build_stubbed(:frequency)).to be_valid
  end

  it "is invalid without a name" do
    expect(build_stubbed(:frequency, name: nil)).to_not be_valid
  end

  it "is invalid with a duplicate name" do
    frequency = create(:frequency)
    expect(build_stubbed(:frequency, name: frequency.name)).to_not be_valid
  end

  describe "#dataflows" do
    before :each do
      @frequency = create(:frequency)
    end

    it "responds to zero Dataflows" do
      expect(@frequency.dataflows).to be_empty
    end

    it "responds to one or more Dataflows" do
      dataflow = create(:dataflow, frequency: @frequency)
      expect(@frequency.dataflows).to include(dataflow)
    end
  end

  describe "#interfaces" do
    before :each do
      @frequency = create(:frequency)
    end

    it "responds to zero Interfaces" do
      expect(@frequency.interfaces).to be_empty
    end

    it "responds to one or more Interfaces" do
      dataflow = create(:dataflow, frequency: @frequency)
      expect(@frequency.interfaces).to include(dataflow.interface)
    end
  end
end
