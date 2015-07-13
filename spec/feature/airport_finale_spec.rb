require 'capybara/rspec'
require 'airport'
require 'plane'

feature 'Grand Finale' do
  airport = Airport.new
  planes = []
  a_plane = Plane.new
  airport.capacity.times { planes << Plane.new }

  scenario 'enough planes can be created to fill the airport' do
    expect(planes.count).to eq airport.capacity
  end

  scenario '6 planes can land at the airport' do
    planes.each { |plane| plane.request_to_land airport }
    expect(airport.landed_planes).to eq planes
  end

  scenario 'plane is denied landing permission when airport is full' do
    full_error = 'Permission denied'
    expect { a_plane.request_to_land airport }.to raise_error full_error
  end

  scenario '6 landed planes have status: landed' do
    planes.each do |plane|
      expect(plane.landed?).to eq true
    end
  end

  scenario 'after all 6 planes takeoff there are no more landed planes' do
    planes.each do |plane|
      plane.request_to_takeoff airport
    end
    expect(airport.landed_planes).to eq []
  end

  scenario 'after all 6 planes takeoff their status is \'flying\'' do
    planes.each do |plane|
      expect(plane.flying?).to eq true
    end
  end
end
