class Station
  def initialize(name)
    @name = name
    @trains = []
  end

  def accept_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
  end

  def trains
    @trains
  end

  def trains_type(type)
    @trains.select { |train| train.type == (type) }
  end

  def name
    @name
  end
end

class Route
  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
  end

  def stations
    @stations
  end

  def add_station(gap_station)
    @stations.insert(-2, gap_station)
  end

  def delete_station(gap_station)
    if gap_station != @stations.first && gap_station != @stations.last
      @stations.delete(gap_station)
    end
  end

  def name
    "#{@first_station.name} - #{@last_station.name}"
  end
end

class Train
  attr_reader :route
  attr_accessor :current_station

  def initialize(number, type_of)
    @number = number
    @type_of = type_of
    @wagons_amount = 0
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

  def previous_station
    stations = route.stations
    next_station_index = stations.index(next_station)
    previous_station = stations[next_station_index - 1]
  end

  def next_station
    stations = route.stations
    current_station_index = stations.index(current_station)
    next_station = stations[current_station_index + 1]
  end

  def type
    @type_of
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

  def wagons_amount
    @wagons_amount
  end

  def hook_wagon
    if @speed == 0
      @wagons_amount += 1
    else
      puts 'Поезд едет'
    end
  end

  def unhook
    if @speed == 0
      @wagons_amount -= 1
    else
      puts 'Поезд едет'
    end
  end
end
