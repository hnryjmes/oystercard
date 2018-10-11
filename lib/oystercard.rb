require 'journey_log'

class Oystercard
  attr_reader :balance, :log

  LIMIT = 90
  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @log = JourneyLog.new
  end

  def top_up(amount)
    raise "Card limit of #{LIMIT} exceeded" if @balance + amount > LIMIT
    @balance += amount
  end

  def touch_in(station)
    deduct(PENALTY_FARE) if in_journey?
    raise "Insufficient balance" if @balance < MIN_FARE
    log.start(station)
  end

  def touch_out(station)
    log.finish(station)
    deduct(log.current_journey.fare)
    log.clear_journey
  end

  def in_journey?
    !!log.current_journey.entry_station && !log.current_journey.exit_station
  end

  private
  def deduct(amount)
    @balance -= amount
  end
end
