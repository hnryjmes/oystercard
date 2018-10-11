require_relative 'journey'

class JourneyLog

  def initialize(journey_class=Journey)
    @journeys = []
    @journey_class = journey_class
  end

  def journeys
    @journeys.dup
  end

  def start(station)
    current_journey.start(station)
  end

  def finish(station)
    current_journey.finish(station)
    get_data
  end

  def get_data
    @journeys << current_journey.data
  end

  def clear_journey
    @current_journey = nil
  end

  def current_journey
    @current_journey ||= @journey_class.new
  end
end
