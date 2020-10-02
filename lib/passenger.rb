require_relative 'csv_record'

module RideShare
  class Passenger < CsvRecord
    attr_reader :name, :phone_number, :trips

    def initialize(id:, name:, phone_number:, trips: [])
      super(id)

      @name = name
      @phone_number = phone_number
      @trips = trips
    end

    def add_trip(trip)
      @trips << trip
    end

    # wave 1 
    # return the total amount of money that passenger spent on their trips
    def net_expenditures
      sum = 0
      @trips.each do |trip|
        sum += trip.cost  
      end 
      return sum
    end 

    # return the total amount of time that passenger spent on their trips
    def total_time_spent
      sum = 0
      @trips.each do |trip|
        sum += trip.duration
      end 
      return sum 
    end 


    private

    def self.from_csv(record)
      return new(
        id: record[:id],
        name: record[:name],
        phone_number: record[:phone_num]
      )
    end

  end
end
