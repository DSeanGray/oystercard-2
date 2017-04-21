require_relative 'station'
require_relative 'journey'

class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @journeys = []
  end

  def top_up(amount)
    raise "Balance cannot exceed #{BALANCE_LIMIT}" if @balance + amount > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_FARE
    @journey = Journey.new
    @journey.start_journey(station)
    @in_journey = true
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @in_journey = false
    @journey.finish_journey(station)
  end

end
