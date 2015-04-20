require_relative 'bike_container'

class Van
  include BikeContainer

  DEFAULT_CAPACITY = 1

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_broken_bikes_from location
    location.bikes.each do |bike|
      transfer_from(bike, location) if bike.broken?
    end
  end

  def collect_working_bikes_from location
    location.bikes.each do |bike|
      transfer_from(bike, location) if !bike.broken?
    end
  end

  def release_bikes_to location
    bikes.each do |bike|
      transfer_to(bike, location)
    end
  end

  def transfer_from bike, location
    location.release(bike)
    accept(bike)
  end

  def transfer_to bike, location
    release(bike)
    location.accept(bike)
  end
end
