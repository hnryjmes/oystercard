# require_relative 'station'

class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def initialize
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

  def start(station)
    @entry_station = station
  end

  def finish(station)
    @exit_station = station
  end

  def data
    { entry: @entry_station, exit: @exit_station }
  end

  def complete?
    !!(@entry_station && @exit_station)
  end

end
