class Airport
  DEFAULT_CAPACITY = 6

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def landing_permission plane
    full? ? deny_landing : allow_to_land(plane)
  end

  def allow_to_land plane
    plane.land
    @planes << plane
  end

  def deny_landing
    fail 'Permission denied'
  end

  def landed_planes
    @planes
  end

  def order_takeoff plane
    plane.take_off
    @planes.delete plane
  end

  def full?
    @planes.count >= @capacity
  end
end
