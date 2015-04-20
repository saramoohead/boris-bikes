require_relative 'bike_container'

class Garage
  include BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end
end
