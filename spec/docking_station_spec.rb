require 'docking_station'
require 'bike'

describe DockingStation do
  it {is_expected.to respond_to(:release_bike)}
  it 'should instantiate the bike class' do
    expect(subject.release_bike).to be_a Bike
  end
  it 'should be working' do
    bike = subject.release_bike
    expect(subject.release_bike.working?).to be true
  end
end
