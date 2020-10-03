require "csv"
require "time"

require_relative "passenger"
require_relative "trip"

module RideShare
  class TripDispatcher
    attr_reader :drivers, :passengers, :trips

    def initialize(directory: "./support")
      @passengers = Passenger.load_all(directory: directory)
      @trips = Trip.load_all(directory: directory)
      @drivers = Driver.load_all(directory: directory)
      connect_trips
    end

    def find_passenger(id)
      Passenger.validate_id(id)
      return @passengers.find { |passenger| passenger.id == id }
    end

    def find_driver(id)
      Driver.validate_id(id)
      return @drivers.find { |driver| driver.id == id }
    end

    def inspect
      # Make puts output more useful
      return "#<#{self.class.name}:0x#{object_id.to_s(16)} \
              #{trips.count} trips, \
              #{drivers.count} drivers, \
              #{passengers.count} passengers>"
    end

    def request_trip(passenger_id)
      random_id = rand(111111..999999)
      available_drivers = @drivers.select { |driver| driver.status == :AVAILABLE }
      if available_drivers.length == 0
        raise ArgumentError.new("No driver available")
      end

      driver = available_drivers[0]

      trip = RideShare::Trip.new(
        id: random_id,
        passenger_id: passenger_id,
        start_time: Time.now,
        end_time: nil,
        rating: nil,
        driver_id: driver.id,
        driver: driver,
      )

      driver.status = :UNAVAILABLE

      trip.connect(passenger, driver)

      @trips << trip

      return trip
    end

    private

    def connect_trips
      @trips.each do |trip|
        passenger = find_passenger(trip.passenger_id)
        driver = find_driver(trip.driver_id)
        trip.connect(passenger, driver)
      end

      return trips
    end
  end
end
