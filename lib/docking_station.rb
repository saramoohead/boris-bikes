require_relative 'bike_container'

class DockingStation
  include BikeContainer

  DEFAULT_CAPACITY = 20

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end

  alias_method :available_bikes, :working_bikes
end
