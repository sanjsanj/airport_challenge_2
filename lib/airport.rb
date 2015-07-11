class Airport
  def initialize
    @planes = []
  end

  def landing_permission plane
    @planes << plane
  end

  def landed_planes
    @planes
  end
end
