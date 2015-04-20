require 'docking_station'

describe DockingStation do

  let(:station) { DockingStation.new(capacity: 123) }

  it 'allows setting a default capacity on initialising' do
    expect(station.capacity).to eq(123)
  end
end
