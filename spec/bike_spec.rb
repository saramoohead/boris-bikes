require 'bike'

describe Bike do

  let(:bike) { Bike.new }

  it 'when created should not be broken' do
    expect(bike).not_to be_broken
  end

  it 'is able to break' do
    bike.break!
    expect(bike).to be_broken
  end

  it 'is able to be fixed' do
    bike.break!
    bike.fix!
    expect(bike).not_to be_broken
  end
end
