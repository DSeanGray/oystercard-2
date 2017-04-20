require_relative 'station'

class Oystercard

  BALANCE_LIMIT = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys

  def initialize
    @balance = 0
    @in_journey = false
    @entry_station = :station
    @exit_station = :station
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
    @entry_station = station
    @in_journey = true
  end

  def touch_out(station)
    @exit_station = station
    deduct(MIN_FARE)
    @in_journey = false
    @journeys << { :entry_station => @entry_station, :exit_station => @exit_station }
  end

end
