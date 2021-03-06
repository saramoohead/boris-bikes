module BikeContainer
  attr_accessor :capacity
  attr_reader :bikes

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def bike_count
    bikes.count
  end

  def accept(bike)
    fail "#{self.class} is full" if full?
    bikes << bike
  end

  def release(bike)
    fail 'No bikes available' if empty?
    bikes.delete(bike)
  end

  def full?
    true if bike_count >= @capacity
  end

  def empty?
    true if bike_count == 0
  end

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

  def broken_bikes
    bikes.select { |bike| bike.broken? }
  end
end
