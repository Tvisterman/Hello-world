require_relative 'train'

class CargoTrain < Train
  def hook_wagon(wagon)
    if wagon.class == CargoWagon
      @wagons << wagon
    else
      puts "Это грузовой поезд"
    end
  end
end
