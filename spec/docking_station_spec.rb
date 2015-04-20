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
    fill_station
    expect(station).to be_full
  end

  it 'will not accept a bike if it is full' do
    fill_station
    expect { station.dock(bike) }.to raise_error('Station is full')
  end

  def fill_station
    20.times { station.dock(bike) }
  end
end
