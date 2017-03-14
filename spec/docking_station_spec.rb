require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end
  end

  it 'should produce a working bike' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.release_bike.working?).to be true
  end

  it 'check dock_bikes method adds to @bikes array' do
    bike = Bike.new
    subject.dock_bike(bike)
    expect(subject.instance_variable_get(:@bikes)).to include(bike)
  end

  it 'raises an error when there are no bikes available' do
    if (subject.instance_variable_get(:@bikes)) == []
      expect {subject.release_bike}.to raise_error
    end
  end

  it 'raises an error when bikes are going over capacity' do
    (subject.instance_variable_get(:@capacity)).times {subject.dock_bike Bike.new}
    expect {subject.dock_bike Bike.new}.to raise_error 'Docking station full'
  end

end
