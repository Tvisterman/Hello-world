require_relative 'train'

class CargoTrain < Train
  def hook_wagon(wagon)
    if wagon.class == CargoWagon
      @wagons << wagon
    else
      puts "Это грузовой поезд"
    end
  end

  def unhook_wagon(wagon)
    if wagon.class == CargoWagon
      @wagons.delete(wagon)
    else
      puts "Это грузовой поезд"
    end
  end
end
