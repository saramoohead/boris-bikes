module BikeContainer
  attr_writer :capacity

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    fail 'Station is full' if full?
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
    # Storing this list in a new array would be duplication.
    # I can just call the method on my existing data set when needed.
    # Use what you have in the simplest form.
    bikes.reject { |bike| bike.broken? }
  end
end
