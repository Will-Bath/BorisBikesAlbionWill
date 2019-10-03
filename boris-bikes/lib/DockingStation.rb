require_relative 'bike'
class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bike

attr_reader :capacity
attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def print_bikes
    @bikes
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    fail 'Bike is broken' if @bikes[0].broken?
    @bikes.pop
  end

  def release_broken_bike_to_van
    temp_arr = []
    for i in (0...@bikes.count)
      if @bikes[i].broken? == true
        temp_arr.push(@bikes[i])
        @bikes.slice(i)
      end
    end
    temp_arr
  end

  def dock(bike, status = 'working')
    if status != 'working'
      bike.report_broken
    end
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
