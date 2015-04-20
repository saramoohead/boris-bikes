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
    holder.accept(bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'can release a bike' do
    holder.accept(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  xit 'will only accept a bike' do
    banana = double :banana
    # allow(bike).to receive(:class).with('Bike')
    expect { holder.accept(banana) }.to raise_error('That is not a bike')
  end

  it 'knows when it is empty' do
    expect(holder.bike_count).to eq(0)
    expect { holder.release(bike) }.to raise_error('No bikes available')
  end

  it 'knows when it is full' do
    fill_holder
    expect(holder).to be_full
  end

  it 'will not accept a bike if it is full' do
    fill_holder
    expect { holder.accept(bike) }.to raise_error('BikeHolder is full')
  end

  it 'provides the list of working bikes' do
    working_bike = bike
    holder.accept(working_bike)
    holder.accept(broken_bike)
    expect(holder.working_bikes).to eq([working_bike])
  end

  it 'provides the list of broken bikes' do
    holder.accept(bike)
    holder.accept(broken_bike)
    expect(holder.broken_bikes).to eq([broken_bike])
  end

  def fill_holder
    capacity.times { holder.accept(bike) }
  end
end
