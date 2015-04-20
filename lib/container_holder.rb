# created to test BikeContainer module
require_relative 'bike_container'

class ContainerHolder
  include BikeContainer

  DEFAULT_CAPACITY = 10

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end
end
