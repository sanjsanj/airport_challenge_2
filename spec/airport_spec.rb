require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe 'capacity' do
    it 'defaults to 6 if not specified' do
      expect(airport.capacity).to eq 6
    end

    it 'can be set on instantiation' do
      airport_2 = Airport.new 20
      expect(airport_2.capacity).to eq 20
    end

    it 'can be changed after instantiation' do
      airport.capacity = 50
      expect(airport.capacity).to eq 50
    end
  end

  describe 'landing' do
    it 'can let a plane land' do
      airport.landing_permission plane
      expect(airport.landed_planes).to include plane
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
      it 'does not allow a plane to land' do
        full_error = 'Permission denied'
        airport.capacity.times { airport.landing_permission plane }
        expect { airport.landing_permission plane }.to raise_error full_error
      end
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
