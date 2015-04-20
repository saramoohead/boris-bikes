require_relative 'bike_container'

class Van
  include BikeContainer

  DEFAULT_CAPACITY = 1

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_broken_bikes_from(location)
    location.bikes.each do |bike|
      transfer_from(bike, from: location) if bike.broken?
    end
  end

  def release_broken_bikes_to(location)
    bikes.each do |bike|
      release(bike)
      location.accept(bike)
    end
  end

  def transfer_from bike, from: location
    from.release(bike)
    accept bike
  end
end
