require_relative 'wagon'

class PassengerWagon < Wagon
  def initialize(seats)
    @seats = seats
  end
end
