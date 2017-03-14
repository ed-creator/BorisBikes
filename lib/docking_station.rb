class DockingStation

  attr_reader :bikes

  def initialize()
    @bikes = []
    @capacity = 20
  end

  def release_bike
    if @bikes == []
      fail
    else
      @bikes.pop
    end
  end

  def dock_bike(bike)
    return fail 'Docking station full' if @bikes.size >= @capacity
    @bikes.push(bike)
  end

end
