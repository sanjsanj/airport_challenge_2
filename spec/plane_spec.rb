require 'plane'

describe Plane do
  let(:plane) { Plane.new }
  let(:airport) { double :airport, order_takeoff: nil }

  it 'is flying when created' do
    expect(plane).to be_flying
  end

  it 'can request to land' do
    expect(plane).to respond_to :request_to_land
  end

  it 'can land' do
    expect(plane).to respond_to :land
  end

  it 'is landed after landing' do
    plane.land
    expect(plane).to be_landed
  end

  it 'can not land while landed' do
    plane.land
    expect { plane.land }.to raise_error 'Already landed'
  end

  it 'can request to takeoff' do
    expect(plane).to respond_to(:request_to_takeoff).with(1).argument
  end

  it 'can take off' do
    expect(plane).to respond_to :take_off
  end

  it 'is flying after take off' do
    plane.land
    plane.take_off
    expect(plane).to be_flying
  end

  it 'can not take off if not landed' do
    expect { plane.take_off }.to raise_error 'Already flying'
  end
end
