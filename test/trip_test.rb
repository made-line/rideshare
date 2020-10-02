require_relative 'test_helper'

describe "Trip class" do
  describe "initialize" do
    before do
      start_time = Time.now - 60 * 60 # 60 minutes
      end_time = start_time + 25 * 60 # 25 minutes
      @trip_data = {
        id: 8,
        passenger: RideShare::Passenger.new(
          id: 1,
          name: "Ada",
          phone_number: "412-432-7640"
        ),
        start_time: start_time,
        end_time: end_time,
        cost: 23.45,
        rating: 3
      }
      @trip = RideShare::Trip.new(@trip_data)
    end

    it "is an instance of Trip" do
      expect(@trip).must_be_kind_of RideShare::Trip
    end

    it "stores an instance of passenger" do
      expect(@trip.passenger).must_be_kind_of RideShare::Passenger
    end

    it "stores an instance of driver" do
      skip # Unskip after wave 2
      expect(@trip.driver).must_be_kind_of RideShare::Driver
    end

    it "raises an error for an invalid rating" do
      [-3, 0, 6].each do |rating|
        @trip_data[:rating] = rating
        expect do
          RideShare::Trip.new(@trip_data)
        end.must_raise ArgumentError
      end
    end


# wave 1

it "verifies end time is after start time" do 
  # Arrange
  start_time = Time.parse("9:00")
  end_time = Time.parse("10:00")

  trip_data = {
    id: 8,
    passenger: RideShare::Passenger.new(
      id: 1,
      name: "Ada",
      phone_number: "412-432-7640"
    ),
    start_time: start_time,
    end_time: end_time,
    cost: 23.45,
    rating: 3
  }

  # Act
  trip = RideShare::Trip.new(trip_data)

  # Assert
  # expect(Trip.new(trip_data)).wont_be_nil
  expect(trip).must_be_instance_of RideShare::Trip
end 


it "raises error if end time is before start time" do 
  # Arrange
  start_time = Time.parse("9:00")
  end_time = Time.parse("8:00")
  trip_data = {
    id: 8,
    passenger: RideShare::Passenger.new(
      id: 1,
      name: "Ada",
      phone_number: "412-432-7640"
    ),
    start_time: start_time,
    end_time: end_time,
    cost: 23.45,
    rating: 3
  }

  # Act & Assert
  expect do
    RideShare::Trip.new(trip_data)
  end.must_raise ArgumentError
end 


it "calculates correct duration" do 

  start_time = Time.parse("2010-10-30")
  end_time = Time.parse("2010-10-31")

  trip_data = {
    id: 8,
    passenger: RideShare::Passenger.new(
      id: 1,
      name: "Ada",
      phone_number: "412-432-7640"
    ),
    start_time: start_time,
    end_time: end_time,
    cost: 23.45,
    rating: 3
  }

  # Act
  trip = RideShare::Trip.new(trip_data)

  # Assert
  expect(trip.duration).must_equal 86400.0

end 

  end
end



