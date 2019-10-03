require 'garage'

describe Garage do
  it 'Store bikes from van' do
    expect(subject.store_from_van([1, 2, 3])).to eq([1, 2, 3])
  end

  it 'Fixes all bikes' do
    bike1, bike2 = Bike.new, Bike.new
    bike1.report_broken
    bike2.report_broken
    arr = [bike1, bike2]
    subject.store_from_van(arr)
    expect(subject).to respond_to(:fix_all_bikes)
  end

  it 'gets the bikes from the van into the garage' do
    arr = [1, 2, 3]
    expect(subject.store_from_van(arr)).to eq(arr)
  end

end
