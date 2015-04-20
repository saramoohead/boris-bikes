require_relative 'bike'

class DockingStation
  attr_reader :station, :station_capacity

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    @station = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def bike_count
    @station.count
  end

  def dock(bike)
    fail 'Station is full' if full?
    @station << bike
  end

  def release(bike)
    @station.delete(bike)
  end

  def full?
    true if bike_count >= @capacity
  end

  def available_bikes
    # I don't need to store this information. I can just call it when needed.
    # So don't create a new array. Just use what you have in the simplest form.
    @station.reject { |bike| bike.broken? }
  end
end
