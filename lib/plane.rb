class Plane
  def initialize
    @location = 'air'
  end

  def flying?
    @location == 'air'
  end

  def land
    if @location == 'air'
      @location = 'ground'
    else
      fail 'Can not land while landed'
    end
  end

  def landed?
    @location == 'ground'
  end

  def take_off
    if @location == 'ground'
      @location = 'air'
    else
      fail 'Can not take off if not landed'
    end
  end
end
