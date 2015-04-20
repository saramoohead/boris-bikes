require 'garage'

describe Garage do
  let(:garage) { Garage.new(capacity: 30) }

  it 'has a capacity when created' do
    expect(garage.capacity).to be(30)
  end
end
