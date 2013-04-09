require 'spec_helper'

describe Dataflow do
  it "has a valid factory" do
    expect(build_stubbed(:dataflow)).to be_valid
  end

  it "is invalid without a Dataset" do
    expect(build_stubbed(:dataflow, dataset: nil)).to_not be_valid
  end

  it "is invalid without a Interface" do
    expect(build_stubbed(:dataflow, interface: nil)).to_not be_valid
  end

  it "is valid with or without a Frequency" do
    frequency = build_stubbed(:frequency)
    expect(build_stubbed(:dataflow, frequency: frequency)).to be_valid
    expect(build_stubbed(:dataflow, frequency: nil)).to be_valid
  end

  it "is unique across Dataset, Interface, and Frequency" do
    dataflow = create(:dataflow)
    expect(build_stubbed(:dataflow, dataset: dataflow.dataset, interface: dataflow.interface, frequency: dataflow.frequency)).to_not be_valid
    expect(build_stubbed(:dataflow, interface: dataflow.interface, frequency: dataflow.frequency)).to be_valid
    expect(build_stubbed(:dataflow, dataset: dataflow.dataset, frequency: dataflow.frequency)).to be_valid
    expect(build_stubbed(:dataflow, dataset: dataflow.dataset, interface: dataflow.interface)).to be_valid
  end
end
