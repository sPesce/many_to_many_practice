class Landmark

    @@all = []
    attr_reader :name, :city

    def initialize(name,city)
        @name,@city = name, city
        @@all << self
    end

    def self.all
        @@all
    end    

    def self.find_all_by_city(city)
        self.all.select{|landmark|landmark.city == city}
    end

    def trips
        Trip.all.select{|trip|trip.landmark == self}
    end

    def tourists
        tourist_arr = trips.map{|trip|trip.tourist}
        return (tourist_arr & tourist_arr)       
    end

end