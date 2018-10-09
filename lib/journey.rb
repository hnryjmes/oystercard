require_relative 'station'

class Journey
  attr_reader :from, :to

  def initialize(entry_station, exit_station)
    @from = entry_station
    @to = exit_station
  end
end
