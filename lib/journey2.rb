class Journey
  def initialize(entry_station: station)
    @entry_station = entry_station
  end

  PENALTY_FARE = 6

  def complete?
    true
  end

  def fare
    1
  end

  def finish(station)
  end


end
