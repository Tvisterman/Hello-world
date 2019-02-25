require_relative 'train'

class PassengerTrain < Train
  def hook_wagon(wagon)
    if wagon.class == PassengerWagon
      @wagons << wagon
    else
      puts "Это пассажирский поезд"
    end
  end

  def unhook_wagon(wagon)
    if wagon.class == PassengerWagon
      @wagons.delete(wagon)
    else
      puts "Это пассажирский поезд"
    end 
  end
end
