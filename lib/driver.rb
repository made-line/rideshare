require "csv"
require "pry"

require_relative "csv_record"

module RideShare
  class Driver < CsvRecord
    attr_reader :name, :vin, :trips
    attr_accessor :status

    def initialize(id:, name:, vin:, status: :AVAILABLE, trips: [])
      super(id)
      @name = name
      @vin = vin
      @status = status

      if trips == nil
        @trips = []
      else
        @trips = trips
      end
      
      if @vin.length != 17
        raise ArgumentError.new("Invalid VIN: must be 17 characters")
      end

      # DeMorgan's Law
      # if !(@status == :AVAILABLE || @status == :UNAVAILABLE)
      #   raise ArgumentError.new("Status must be available or unavailable")
      # end

      if @status.to_sym != :AVAILABLE && @status.to_sym != :UNAVAILABLE
        raise ArgumentError.new("Status: #{@status} must be available or unavailable")
      end
    end

    def add_trip(trip)
      @trips << trip
    end

    # calculate average rating
    def average_rating
      if @trips == nil || @trips == []
        return 0
      end

      completed_trips = @trips.select { |trip| trip.end_time != nil}
      if completed_trips == []
        return 0
      end

      ratings = completed_trips.map { |trip| trip.rating }
      mean = (ratings.sum.to_f) / (ratings.length)

      return mean
    end

    # calculate total revenue
    def total_revenue
      if @trips == nil || @trips == []
        return 0
      end

      completed_trips = @trips.select { |trip| trip.end_time != nil}
      if completed_trips == []
        return 0
      end

      revenue = completed_trips.map { |trip| trip.cost * 0.8 - 1.65 }
      total = revenue.sum.to_f

      if total < 1.65
        return 0
      end

      return total
    end

    private

    def self.from_csv(record)
      return self.new(
               id: record[:id],
               name: record[:name],
               vin: record[:vin],
               status: record[:status],
               trips: record[:trips],
             )
    end
  end
end
