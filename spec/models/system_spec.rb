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
      expect(system.source_interfaces).to include(interface)
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
      expect(system.target_interfaces).to include(interface)
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
      expect(target_system.source_systems).to include(source_system)
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
      expect(source_system.target_systems).to include(target_system)
    end
  end

  describe "#context_maps" do
    it "responds to zero ContextMaps" do
      system = create(:system)
      expect(system.context_maps).to be_empty
    end

    it "responds to one or more ContextMaps" do
      system = create(:system)
      context_map = create(:context_map, contextable: system)
      expect(system.context_maps).to include(context_map)
    end
  end

  describe "#contexts" do
    it "responds to zero Contexts" do
      system = create(:system)
      expect(system.contexts).to be_empty
    end

    it "responds to one or more Contexts" do
      system = create(:system)
      context_map = create(:context_map, contextable: system)
      expect(system.contexts).to include(context_map.context)
    end
  end

  describe "#all_interfaces" do
    it "responds to zero Interfaces" do
      system = create(:system)
      expect(system.all_interfaces).to be_empty
    end

    it "responds to both a source and target Interface" do
      system = create(:system)
      source_interface = create(:interface, source_system: system)
      target_interface = create(:interface, target_system: system)
      expect(system.all_interfaces).to include(source_interface)
      expect(system.all_interfaces).to include(target_interface)
    end
  end

  describe "#all_systems" do
    it "responds to zero Systems" do
      system = create(:system)
      expect(system.all_systems).to be_empty
    end

    it "responds to both a source and target System" do
      source_system = create(:system)
      target_system = create(:system)
      create(:interface, source_system: source_system, target_system: target_system)
      expect(source_system.all_systems).to include(target_system)
      expect(target_system.all_systems).to include(source_system)
    end
  end

  describe "#all_dataflows" do
    it "responds to zero Dataflows" do
      system = create(:system)
      expect(system.all_dataflows).to be_empty
    end

    it "responds to both a source and target Dataflow" do
      system = create(:system)
      source_interface = create(:interface, source_system: system)
      target_interface = create(:interface, target_system: system)
      source_dataflow = create(:dataflow, interface: source_interface)
      target_dataflow = create(:dataflow, interface: target_interface)
      expect(system.all_dataflows).to include(source_dataflow)
      expect(system.all_dataflows).to include(target_dataflow)
    end
  end
end
