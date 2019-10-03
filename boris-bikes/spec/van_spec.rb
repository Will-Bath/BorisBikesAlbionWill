require 'van'

describe Van do
  it 'get bikes from the dock' do
    docking_station = DockingStation.new
    bike1 = Bike.new
    docking_station.dock(bike1, 'broken')
    subject.gets_bikes_from_dock(docking_station)
    # Outputted print_van_stuff, came out as array so fix line 10 soon
    expect(subject.print_van_stuff).to eq([bike1])
  end

  it 'gets bikes from the garage' do
    expect(subject.gets_bikes_from_garage([1, 2])).to eq([1, 2])
  end

  it 'dock bikes to the docking station' do
    docking_station = DockingStation.new
    bike1, bike2, bike3 = Bike.new, Bike.new, Bike.new
    subject.storage_van = [bike1, bike2, bike3]
    subject.dock_bikes_from_van(docking_station)
    expect(docking_station.print_bikes).to eq([bike1, bike2, bike3])
  end
end
