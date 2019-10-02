require 'van'

describe Van do
  it 'get bikes from the dock' do
    docking_station = DockingStation.new
    bike1 = Bike.new
    bike1.report_broken
    subject.gets_bikes_from_dock(docking_station)
    expect(subject.print_van_stuff).to eq(bike1)
  end

  it 'dock bikes to the docking station' do
    docking_station = DockingStation.new
    subject.storage_van = [1, 2, 3, 4]
    subject.dock_bikes_from_van(docking_station)
    expect(docking_station.print_bikes).to eq(subject.storage_van)
  end

  it 'can dock a bike' do
    docking_station = DockingStation.new
    subject.storage_van = [1, 2, 3 , 4]
    subject.dock_bikes_from_van(docking_station)
    expect(docking_station.print_bikes).to eq(subject.storage_van)
  end
end
