class Plane
  def initialize
    @location = 'air'
  end

  def flying?
    @location == 'air'
  end

  def request_to_land airport
    airport.landing_permission self
  end

  def land
    @location == 'air' ? @location = 'ground' : fail('Already landed')
  end

  def landed?
    @location == 'ground'
  end

  def request_to_takeoff airport
    airport.order_takeoff self
  end

  def take_off
    @location == 'ground' ? @location = 'air' : fail('Already flying')
  end
end
