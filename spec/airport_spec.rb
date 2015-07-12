require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe 'landing' do
    it 'can let a plane land' do
      airport.landing_permission plane
      expect(airport.landed_planes).to include plane
    end

    it 'does not let a plane land when airport is full' do
      full_error = 'Permission denied'
      airport.capacity.times { airport.landing_permission plane }
      expect { airport.landing_permission plane }.to raise_error full_error
    end
  end

  describe 'take off' do
    it 'can let a plane take off' do
      airport.landing_permission plane
      airport.order_takeoff plane
      expect(airport.landed_planes).to eq []
    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      xit 'does not allow a plane to land'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
