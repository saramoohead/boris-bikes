require 'bike_container'

class BikeHolder
  include BikeContainer

  def initialize
    @bikes = []
    @capacity = 10
  end
end

describe BikeContainer do

  let(:holder) { BikeHolder.new }
  let(:capacity) { 10 }
  let(:bike) { double :bike, broken?: false }
  let(:broken_bike) { double :broken_bike, broken?: true }

  it 'can store a bike' do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'can release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'knows when it is empty' do
    expect(holder.bike_count).to eq(0)
    expect { holder.release(bike) }.to raise_error('No bikes available')
  end

  it 'knows when it is full' do
    expect(holder).not_to be_full
    fill_holder
    expect(holder).to be_full
  end

  it 'will not accept a bike if it is full' do
    fill_holder
    expect { holder.dock(bike) }.to raise_error('Station is full')
  end

  it 'provides the list of working bikes' do
    working_bike = bike
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.working_bikes).to eq([working_bike])
  end

  def fill_holder
    capacity.times { holder.dock(bike) }
  end
end
