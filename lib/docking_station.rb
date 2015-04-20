class DockingStation
  attr_reader :station, :station_capacity

  def initialize
    @station = []
    @station_capacity = 20
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

  def full?
    true if @station.count >= @station_capacity
  end
end
