class Plane
  def initialize
    @location = 'air'
  end

  def flying?
    @location == 'air'
  end

  def land
    @location == 'air' ? @location = 'ground' : fail('Already landed')
  end

  def landed?
    @location == 'ground'
  end

  def take_off
    @location == 'ground' ? @location = 'air' : fail('Already flying')
  end
end
