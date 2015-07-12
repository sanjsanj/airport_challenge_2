class Airport
  DEFAULT_CAPACITY = 6

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def landing_permission plane
    full? ? fail('Permission denied') : @planes << plane
  end

  def landed_planes
    @planes
  end

  def order_takeoff plane
    @planes.delete plane
  end

  def full?
    @planes.count >= @capacity
  end
end
