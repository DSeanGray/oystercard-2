
class Journey

  attr_reader :entry_station, :exit_station

  def initialize
    @journeys = {}
  end

  def start_journey(station)
    @journeys[:entry_station] = station
  end

  def finish_journey(station)
    @journeys[:exit_station] = station
  end

end
