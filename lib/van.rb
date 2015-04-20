require_relative 'bike_container'

class Van
  include BikeContainer

  DEFAULT_CAPACITY = 1

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_broken_bikes_from(location)
    location.bikes.each do |bike|
      transfer(bike, to: location) if bike.broken?
    end
  end

  def transfer bike, to: location
      to.release(bike)
      accept bike
  end
end
