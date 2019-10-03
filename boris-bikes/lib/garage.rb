class Garage

  attr_accessor :storage
  def initialize
    @storage = []
  end

  def fix_all_bikes
    @storage.each do |bike|
      bike = bike.working?
    end
  end

  def store_from_van(arr)
    arr.each do |bike|
      @storage << bike
    end
    return @storage
  end

end
