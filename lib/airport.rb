class Airport
  DEFAULT_CAPACITY = 6

  attr_accessor :capacity, :weather

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
    @weather = 'sunny'
  end

  def landing_permission plane
    fail 'Denied due to weather' if @weather != 'sunny'
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
    fail 'Denied due to weather' if @weather != 'sunny'
    plane.take_off
    @planes.delete plane
  end

  def full?
    @planes.count >= @capacity
  end
end
