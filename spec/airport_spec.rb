require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane, land: nil, take_off: nil }

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
    it 'can land a plane' do
      airport.landing_permission plane
      expect(airport.landed_planes).to include plane
    end
  end

  describe 'take off' do
    it 'can take a plane off' do
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

    context 'when weather conditions are stormy' do
      weather_error = 'Denied due to bad weather'

      before(:each) do
        airport.weather = 'stormy'
      end

      it 'does not allow a plane to land' do
        expect { airport.landing_permission plane }.to raise_error weather_error
      end

      it 'does not allow a plane to take off' do
        expect { airport.landing_permission plane }.to raise_error weather_error
      end
    end
  end
end
