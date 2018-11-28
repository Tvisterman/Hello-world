class Station
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

class Route
  def initialize(first_staition, last_station)
    @first_staition = first_staition
    @last_station = last_station
    @stations = [@first_staition, @last_station]
  end

  def stations
    @stations
  end

  def name
    "#{@first_station.name} - #{@last_station.name}"
  end
end

class Train
  def initialize (number, type_of, wagons_amount)
    @number = number
    @type_of = type_of
    @wagons_amount = wagons_amount
    @speed = 0
  end

  def acceleration
    @speed += 10
  end

  def current_speed
    @speed
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
