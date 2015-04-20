require_relative 'bike_container'

class Van
  include BikeContainer

  DEFAULT_CAPACITY = 1

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
  end
end
