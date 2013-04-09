require 'spec_helper'

describe Dataset do
  it "has a valid factory" do
    expect(build_stubbed(:dataset)).to be_valid
  end

  it "is invalid without a name" do
    expect(build_stubbed(:dataset, name: nil)).to_not be_valid
  end

  it "is valid with or without a description" do
    expect(build_stubbed(:dataset, description: "Foo")).to be_valid
    expect(build_stubbed(:dataset, description: nil)).to be_valid
  end

  describe "#dataflows" do
    before :each do
      @dataset = create(:dataset)
    end

    it "responds to zero Dataflows" do
      expect(@dataset.dataflows).to be_empty
    end

    it "responds to one or more Dataflows" do
      dataflow = create(:dataflow, dataset: @dataset)
      expect(@dataset.dataflows).to include(dataflow)
    end
  end

  describe "#interfaces" do
    before :each do
      @dataset = create(:dataset)
    end

    it "responds to zero Interfaces" do
      expect(@dataset.interfaces).to be_empty
    end

    it "responds to one or more Interfaces" do
      dataflow = create(:dataflow, dataset: @dataset)
      expect(@dataset.interfaces).to include(dataflow.interface)
    end
  end

  describe "#context_maps" do
    before :each do
      @dataset = create(:dataset)
    end

    it "responds to zero ContextMaps" do
      expect(@dataset.context_maps).to be_empty
    end

    it "responds to one or more ContextMaps" do
      context_map = create(:context_map, contextable: @dataset)
      expect(@dataset.context_maps).to include(context_map)
    end
  end

  describe "#contexts" do
    before :each do
      @dataset = create(:dataset)
    end

    it "responds to zero Contexts" do
      expect(@dataset.contexts).to be_empty
    end

    it "responds to one or more Contexts" do
      context_map = create(:context_map, contextable: @dataset)
      expect(@dataset.contexts).to include(context_map.context)
    end
  end
end
