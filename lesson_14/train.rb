class Train
  attr_reader :route, :wagons, :number
  attr_accessor :current_station

  def initialize(number)
    @number = number
    @wagons = []
    @speed = 0
  end

  def move_forward
    if next_station
      current_station.send_train(self)
      next_station.accept_train(self)
      current_station = next_station
    end
  end

  def move_back
    if previous_station
      current_station.send_train(self)
      previous_station.accept_train(self)
      current_station = previous_station
    end
  end

  def acceleration
    @speed += 10
  end

  def current_speed
    @speed
  end

  def accept_route(route)
    @route = route
    @route.stations.first.accept_train(self)
    @current_station = @route.stations.first
  end

  def stop
    @speed = 0
    p 'Полная остановка'
  end


  def previous_station
    next_station_index = station_index(next_station)
    stations[next_station_index - 1]
  end

  def next_station
    current_station_index = station_index(current_station)
    stations[current_station_index + 1]
  end

  private
#непонятно как взаимодействуют
  def stations
    route.stations
  end

  def station_index(station)
    stations.index(station)
  end
end
