require_relative 'cargo_train'
require_relative 'passenger_train'
require_relative 'station'
require_relative 'route'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

class App
  attr_accessor  :trains

  def initialize
    @stations = []
    @trains = []
    @routes = []
    @wagons = []

  end

  def start
    loop do
      puts '1. Создать станцию'
      puts '2. Создать поезд'
      puts '3. Создать маршрут'
      puts '4. Назначить маршрут поезду'
      puts '5. Создать вагон'
      puts '6. Прицепить вагон к поезду'
      puts '7. Добавить станцию'
      puts '8. Просмотреть список станции'
      puts '9. Удалить станцию'
      puts '10. Отцепить вагон'
      puts '11. Двигаться вперед'
      puts '12. Двигаться назад'
      puts '13. Показать список поездов на станции'
      puts 'Выберите вариант'

      choice = gets.chomp
      break if choice.strip == 'exit'

      case choice.to_i
      when 1
        create_station
      when 2
        create_train
      when 3
        create_route
      when 4
        assign_route
      when 5
        create_wagon
      when 6
        hook_wagon
      when 7
        add_station
      when 8
        stations
      when 9
        delete_station
      when 10
        unhook_wagon
      when 11
        move_forward
      when 12
        move_back
      when 13
        train_on_the_station
      else
        puts 'Введите правильное значение'
      end
    end
  end

  private

  def assign_route
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train.number}"}
    puts "Выберите поезд"
    number_train = gets.chomp.to_i
    train = @trains[number_train - 1]


    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route.name}"}
    puts "Выберите номер маршрута который нужно назначить поезду"
    number_route = gets.chomp.to_i
    route = @routes[number_route - 1]
    train.accept_route(route)
    puts 'Маршрут назначен'
  end

  def create_route
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}"}
    puts "Ввидите номер первой станции"
    number1 = gets.chomp.to_i
    station1 = @stations[number1 - 1]

    puts "Ввидите номер второй станции"
    number2 = gets.chomp.to_i
    station2 = @stations[number2 - 1]

    route = Route.new(station1, station2)
    @routes << route
    puts 'Маршрут успешно создан'
  end

  def add_station
    @stations.each.with_index(1) {|station, index| puts "#{index}. #{station.name}"}
    puts 'Ввидите номер добавочной станции'
    station_number = gets.chomp.to_i
    gap_station = @stations[station_number - 1]

    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route.name}"}
    puts "Выберите маршрут в который нужно добавить"
    number_route = gets.chomp.to_i
    route = @routes[number_route - 1]
    route.add_station(gap_station)
    puts 'Станция успешно добавленна в маршрут'
  end

  def delete_station
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}"}
    puts 'Выберите номер станции которую хотите удалить'
    number = gets.chomp.to_i
    choice_station = @stations[number - 1]

    @routes.each.with_index(1) { |route, index| puts "#{index}. #{route.name}"}
    puts "Выберите маршрут из которого нужно удалить станцию"
    number_route = gets.chomp.to_i
    route = @routes[number_route - 1]
    route.delete_station(choice_station)
    puts 'Станция удаленна'
  end

  def hook_wagon
    index_train
    @wagons.each.with_index(1) { |wagon, index| puts "#{index}. #{wagon}"}
    puts 'Выберите вагон'
    number_wagon = gets.chomp.to_i
    wagon = @wagons[number_wagon - 1]
    @train.hook_wagon(wagon)
    puts 'Вагон прицеплен'
  end

  def unhook_wagon
    index_train
    @wagons.each.with_index(1) { |wagon, index| puts "#{index}. #{wagon}"}
    puts 'Выберите вагон'
    number_wagon = gets.chomp.to_i
    wagon = @wagons[number_wagon - 1]
    @train.unhook_wagon(wagon)
    puts 'Вагон отцеплен'
  end

  def move_forward
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train.number}"}
    puts "Выберите поезд который поедет вперед"
    number_train = gets.chomp.to_i
    train = @trains[number_train - 1]
    train.move_forward
    puts 'Поезд двигаеться вперед'
  end

  def move_back
    @trains.each.with_index(1) { |train, index| puts "#{index}. #{train.number}"}
    puts "Выберите поезд который поедет назад"
    number_train = gets.chomp.to_i
    train = @trains[number_train - 1]
    train.move_back
    puts 'Поезд двигаеться назад'
  end

  def train_on_the_station
    stations
    puts 'Выберите станцию'
    number_train = gets.chomp.to_i
    station = @stations[number_train - 1]
    station.train
  end


  def create_train
    puts '1. Грузовой поезд'
    puts '2. Пассажирский поезд'
    puts 'Выберите какой поезд создать?'

    choice = gets.chomp.to_i

      case choice.to_i
      when 1
        puts 'Введите номер поезда'
        number = gets.chomp

        train = CargoTrain.new(number)
        @trains << train
        puts 'Грузовой поезд успешно создан'
      when 2
        puts 'Введите номер поезда'
        number = gets.chomp

        train = PassengerTrain.new(number)
        @trains << train
        puts 'Пассажирский поезд успешно создан'
    end
  end

  def create_wagon
    puts '1. Пассажирский вагон'
    puts '2. Грузовой вагон'
    puts 'Выберите вагон'

    choice = gets.chomp.to_i

      case choice.to_i
      when 1
      puts 'Укажите количество мест'

      seats = gets.chomp.to_i
      passenger_wagon = PassengerWagon.new(seats)
      @wagons << passenger_wagon
      puts 'Пассажирский вагон успешно создан'

      when 2
      puts 'Укажите объем'

      volume = gets.chomp.to_i
      cargo_wagon = CargoWagon.new(volume)
      @wagons << cargo_wagon
      puts 'Грузовой вагон успешно создан'
    end
  end

  protected

  def index_train
    @trains.each.with_index(1) {|train, index| puts "#{index}. #{train.number}"}
    puts "Выберите поезд"
    number_train = gets.chomp.to_i
    @train = @trains[number_train - 1]
  end


  def create_station
    puts 'Введите название станции'
    name = gets.chomp
    station = Station.new(name)
    @stations << station
  end

  def stations
    @stations.each.with_index(1) { |station, index| puts "#{index}. #{station.name}"}
  end
end
