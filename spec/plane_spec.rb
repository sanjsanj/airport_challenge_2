require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do
  let(:plane) { Plane.new }

  it 'is flying when created' do
    expect(plane).to be_flying
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
    expect { plane.land }.to raise_error 'Can not land while landed'
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
    expect { plane.take_off }.to raise_error 'Can not take off if not landed'
  end

end
