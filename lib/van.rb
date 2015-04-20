require_relative 'bike_container'

class Van
  include BikeContainer

  DEFAULT_CAPACITY = 1

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  def collect_broken_bikes_from(location)
    location.bikes.each do |bike|
      # but is station right? where does that come from?
      location.release(bike) if bike.broken?
      accept bike if bike.broken?
    end
  end
end
