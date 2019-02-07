require_relative 'wagon'

class PassangerWagon < Wagon
  def initialize(seats)
    @seats = seats
  end
end
