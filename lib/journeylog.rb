class JourneyLog
  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end

  def journeys
    @journeys.dup
  end

  def start(station)
    @journeys << @journey_class.new(entry_station: station)
  end

  def finish(station)

  end

  private
  def current_journey
    @current_journey ||= journey_class.new
  end
end
