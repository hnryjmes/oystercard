require_relative 'station'

class Journey
  attr_reader :from, :to

  def initialize(entry_station: station, exit_station: station)
    @from = entry_station
    @to = exit_station
  end
end
