require_relative 'wagon'

class CargoWagon < Wagon
  def initialize(volume)
    @volume = volume
  end
end
