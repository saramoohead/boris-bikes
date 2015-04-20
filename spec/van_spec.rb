require 'van'

describe Van do
  it 'has a capacity when created' do
    van = Van.new(capacity: 6)
    expect(van.capacity).to be(6)
  end  
end
