class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [@first_station, @last_station]
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
