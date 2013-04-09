require 'spec_helper'

describe System do
  it "has a valid factory" do
    expect(create(:system)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:system, name: nil)).to_not be_valid
  end

  it "has a unique name" do
    system = create(:system)
    expect(build(:system, name: system.name)).to_not be_valid
  end

  describe "#source_interfaces" do
    it "responds to zero source Interfaces" do
      system = create(:system)
      expect(system.source_interfaces).to be_empty
    end

    it "responds to one or more source Interfaces" do
      system = create(:system)
      interface = create(:interface, source_system: system)
      expect(system.source_interfaces.first).to eq(interface)
    end
  end

  describe "#target_interfaces" do
    it "responds to zero target Interfaces" do
      system = create(:system)
      expect(system.target_interfaces).to be_empty
    end

    it "responds to one or more target Interfaces" do
      system = create(:system)
      interface = create(:interface, target_system: system)
      expect(system.target_interfaces.first).to eq(interface)
    end
  end

  describe "#source_systems" do
    it "responds to zero source Systems" do
      system = create(:system)
      expect(system.source_systems).to be_empty
    end

    it "responds to one or more source Systems" do
      source_system = create(:system)
      target_system = create(:system)
      interface = create(:interface, source_system: source_system, target_system: target_system)
      expect(target_system.source_systems.first).to eq(source_system)
    end
  end

  describe "#target_systems" do
    it "responds to zero target Systems" do
      system = create(:system)
      expect(system.target_systems).to be_empty
    end

    it "responds to one or more target Systems" do
      source_system = create(:system)
      target_system = create(:system)
      interface = create(:interface, source_system: source_system, target_system: target_system)
      expect(source_system.target_systems.first).to eq(target_system)
    end
  end

  describe "#context_maps" do
    pending
  end

  describe "#contexts" do
    pending
  end
end
