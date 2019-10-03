class Van

  attr_accessor :storage_van
  def initialize
    @storage_van = []
  end

  def print_van_stuff
    return @storage_van
  end

  def gets_bikes_from_dock(docking_station)
    temp_arr = docking_station.release_broken_bike_to_van
    for i in (0...temp_arr.count)
      @storage_van.push(temp_arr[i])
      temp_arr.slice(i)
    end

  end

  def gets_bikes_from_garage(arr)
    arr.each do |bike|
      @storage_van << bike
    end
    return @storage_van
  end

  def dock_bikes_from_van(docking_station)
    for i in (0...@storage_van.count)
      if @storage_van[i].broken? == false
        docking_station.dock(@storage_van[i])
        @storage_van.slice(i)
      end
    end
  end

end
