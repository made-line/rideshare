require_relative 'test_helper'

describe "Passenger class" do

  describe "Passenger instantiation" do
    before do
      @passenger = RideShare::Passenger.new(id: 1, name: "Smithy", phone_number: "353-533-5334")
    end

    # wave 1 
    it "calculates net expenditures" do
      passenger = RideShare::Passenger.new(id: 7, name: "BoJack", phone_number: "2068958734")
      driver = RideShare::Driver.new(id: 3, name: "Ruby", vin: "12345678912345678", status: :AVAILABLE, trips: [])

      trip_data1 = {
        id: 8,
        passenger: passenger,
        start_time: Time.parse("9:00"),
        end_time: Time.parse("10:00"),
        cost: 23.45,
        rating: 3,
        driver_id: 10,
        driver: driver 
      }
      trip1 = RideShare::Trip.new(trip_data1)
      
      passenger.add_trip(trip1);

      trip_data2 = {
        id: 9,
        passenger: passenger,
        start_time: Time.parse("10:55"),
        end_time: Time.parse("11:00"),
        cost: 3.00,
        rating: 5,
        driver_id: 10,
        driver: driver
      }
      trip2 = RideShare::Trip.new(trip_data2)
      
      passenger.add_trip(trip2);

      expect(passenger.net_expenditures).must_equal 26.45
    end



    it "calculates net duration" do
      passenger = RideShare::Passenger.new(id: 7, name: "BoJack", phone_number: "2068958734")
      driver = RideShare::Driver.new(id: 3, name: "Ruby", vin: "12345678912345678", status: :AVAILABLE, trips: [])
      trip_data1 = {
        id: 8,
        passenger: passenger,
        start_time: Time.parse("9:00"),
        end_time: Time.parse("10:00"),
        cost: 23.45,
        rating: 3,
        driver_id: 2, 
        driver: driver, 
      }
      trip1 = RideShare::Trip.new(trip_data1)
      
      passenger.add_trip(trip1);

      trip_data2 = {
        id: 9,
        passenger: passenger,
        start_time: Time.parse("2:55"),
        end_time: Time.parse("3:00"),
        cost: 3.00,
        rating: 5,
        driver_id: 2, 
        driver: driver
      }
      trip2 = RideShare::Trip.new(trip_data2)
      
      passenger.add_trip(trip2);

      expect(passenger.total_time_spent).must_equal 3900
    end




    it "is an instance of Passenger" do
      expect(@passenger).must_be_kind_of RideShare::Passenger
    end

    it "throws an argument error with a bad ID value" do
      expect do
        RideShare::Passenger.new(id: 0, name: "Smithy")
      end.must_raise ArgumentError
    end

    it "sets trips to an empty array if not provided" do
      expect(@passenger.trips).must_be_kind_of Array
      expect(@passenger.trips.length).must_equal 0
    end

    it "is set up for specific attributes and data types" do
      [:id, :name, :phone_number, :trips].each do |prop|
        expect(@passenger).must_respond_to prop
      end

      expect(@passenger.id).must_be_kind_of Integer
      expect(@passenger.name).must_be_kind_of String
      expect(@passenger.phone_number).must_be_kind_of String
      expect(@passenger.trips).must_be_kind_of Array
    end
  end


  describe "trips property" do
    before do
      # TODO: you'll need to add a driver at some point here.
      @passenger = RideShare::Passenger.new(
        id: 9,
        name: "Merl Glover III",
        phone_number: "1-602-620-2330 x3723",
        trips: []
        )
      trip = RideShare::Trip.new(
        id: 8,
        passenger: @passenger,
        start_time: Time.new(2016, 8, 8),
        end_time: Time.new(2016, 8, 9),
        rating: 5,
        driver_id: 1,
        driver: nil

        )

      @passenger.add_trip(trip)
    end

    it "each item in array is a Trip instance" do
      @passenger.trips.each do |trip|
        expect(trip).must_be_kind_of RideShare::Trip
      end
    end

    it "all Trips must have the same passenger's passenger id" do
      @passenger.trips.each do |trip|
        expect(trip.passenger.id).must_equal 9
      end
    end
  end

  describe "net_expenditures" do
    # You add tests for the net_expenditures method
  end
end
