describe Bike do
  it 'when created should not be broken' do
    the_bike = Bike.new
    expect(the_bike).not_to be_broken
  end
end
