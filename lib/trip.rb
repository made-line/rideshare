require "csv"
require "time"

require_relative "csv_record"

module RideShare
  class Trip < CsvRecord
    attr_reader :id, :passenger, :passenger_id, :start_time, :end_time, :cost, :rating, :driver_id, :driver

    def initialize(
      id:,
      # provide default values as nil so that both aren't required
      passenger: nil,
      passenger_id: nil,
      start_time:,
      end_time:,
      cost: nil,
      rating:,
      driver_id: nil,
      driver: nil
    )
      super(id)

      if end_time < start_time
        raise ArgumentError.new("End time must be after start time")
      end

      if passenger
        @passenger = passenger
        @passenger_id = passenger.id
      elsif passenger_id
        @passenger_id = passenger_id
      else
        raise ArgumentError, "Passenger or passenger_id is required"
      end

      @start_time = start_time
      @end_time = end_time
      @cost = cost
      @rating = rating
      @driver_id = driver_id
      @driver = driver

      if @rating > 5 || @rating < 1
        raise ArgumentError.new("Invalid rating #{@rating}")
      end
    end

    def inspect
      # Prevent infinite loop when puts-ing a Trip
      # trip contains a passenger contains a trip contains a passenger...
      "#<#{self.class.name}:0x#{self.object_id.to_s(16)} " +
        "id=#{id.inspect} " +
        "passenger_id=#{passenger&.id.inspect} " +
        "start_time=#{start_time} " +
        "end_time=#{end_time} " +
        "cost=#{cost} " +
        "rating=#{rating}>"
    end

    def connect(passenger, driver)
      @passenger = passenger
      @driver = driver
      passenger.add_trip(self)
      driver.add_trip(self)
    end

    def duration
      return @end_time - @start_time
    end

    private

    def self.from_csv(record)
      start_time = Time.parse(record[:start_time])
      end_time = Time.parse(record[:end_time])

      return self.new(
               id: record[:id],
               passenger_id: record[:passenger_id],
               start_time: start_time,
               end_time: end_time,
               cost: record[:cost],
               rating: record[:rating],
               driver_id: record[:driver_id],
               # ? driver: record[:driver]
             )
    end
  end
end
