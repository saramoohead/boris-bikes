require 'docking_station'

describe DockingStation do

  let(:bike) { Bike.new }
  let(:station) { DockingStation.new }
  it 'can store a bike' do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)
  end

  it 'can release a bike' do
    station.dock(bike)
    station.release(bike)
    expect(station.bike_count).to eq(0)
  end

  it 'knows when it is full' do
    expect(station).not_to be_full
    20.times { station.dock(bike) }
    expect(station).to be_full
  end

  it 'will not accept a bike if it is full' do
    20.times { station.dock(bike) }
    expect { station.dock(bike) }.to raise_error('Station is full')
    expect(station.bike_count).to eq(20)
  end
end
