require 'DockingStation'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = double(:bike, broken?: false)
      subject.dock(bike)
       #we want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      # Let's not dock a bike first:
      # remember subject == DockingStation.new
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end

    it 'has a broken bike that returns as broken' do
      docking_station = DockingStation.new
      bike = Bike.new

      docking_station.dock(bike, 'broken')

      expect{ raise docking_station.release_bike}. to raise_error 'Bike is broken'
    end

      it 'can accept a broken' do
        docking_station = DockingStation.new
        bike = Bike.new

        docking_station.dock(bike, 'broken')

        expect(docking_station.print_bikes).to include(bike)
    end
  end

    # existing tests omitted for brevity
    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

end
