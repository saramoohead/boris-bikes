class DockingStation
  attr_reader :station

  def initialize
    @station = []
  end

  def bike_count
    @station.count
  end

  def dock(bike)
    @station << bike
  end

  def release(bike)
    @station.delete(bike)
  end
end
