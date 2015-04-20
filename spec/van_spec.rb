require 'van'
require 'garage'

describe Van do
  let(:van) { Van.new(capacity: 6) }
  let(:working_bike) { double :working_bike, broken?: false }
  let(:broken_bike) { double :broken_bike, broken?: true }
  let(:docking_station) { double :docking_station, bikes: ([working_bike, broken_bike]) }
  let(:garage) { Garage.new(capacity: 30) }

  it 'has a capacity when created' do
    expect(van.capacity).to be(6)
  end

  it 'collects broken bikes from a station' do
    allow(docking_station).to receive(:release)
    van.collect_broken_bikes_from docking_station
    expect(van.bikes).to eq([broken_bike])
  end

  it 'removes broken bikes from a station when collecting' do
    expect(docking_station).to receive(:release).with broken_bike
    van.collect_broken_bikes_from docking_station
  end

  it 'releases broken bikes at the garage' do
    van.accept(broken_bike)
    van.release_broken_bikes_to garage
    expect(van.bikes).not_to eq([broken_bike])
  end
end
