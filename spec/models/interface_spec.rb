require 'spec_helper'

describe Interface do
  it "has a valid factory" do
    expect(build_stubbed(:interface)).to be_valid
  end

  it "is invalid without a source System" do
    expect(build_stubbed(:interface, source_system: nil)).to_not be_valid
  end

  it "is invalid without a target System" do
    expect(build_stubbed(:interface, target_system: nil)).to_not be_valid
  end

  it "is unique across source System and target System" do
    interface = create(:interface)
    expect(build_stubbed(:interface, source_system: interface.source_system, target_system: interface.target_system)).to_not be_valid
    expect(build_stubbed(:interface, source_system: interface.source_system)).to be_valid
    expect(build_stubbed(:interface, target_system: interface.target_system)).to be_valid
  end

  describe "#dataflows" do
    before :each do
      @interface = create(:interface)
    end

    it "responds to zero Dataflows" do
      expect(@interface.dataflows).to be_empty
    end

    it "responds to one or more Dataflows" do
      dataflow = create(:dataflow, interface: @interface)
      expect(@interface.dataflows).to include(dataflow)
    end
  end

  describe "#frequences" do
    before :each do
      @interface = create(:interface)
    end

    it "responds to zero Frequences" do
      expect(@interface.dataflows).to be_empty
    end

    it "responds to one or more Frequences" do
      dataflow = create(:dataflow, interface: @interface)
      expect(@interface.frequencies).to include(dataflow.frequency)
    end
  end
end
