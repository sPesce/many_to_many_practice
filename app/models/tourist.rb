class Tourist

    @@all = []
    attr_reader :name

    def initialize(name)
        @name = name
        self.save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.find_by_name(name)
        @@all.each{|tourist| return tourist if tourist.name == name }
        return "Name not found"
    end

    def trips
        Trip.all.select{|trip|trip.tourist == self}
    end
    
    def landmarks
        trips.map{|trip|trip.landmark}.uniq
    end

    def visit_landmark(landmark)
        Trip.new(self,landmark)
    end

    def never_visited
        Landmark.all.uniq - self.landmarks
    end

    def self.clear
        @@all = []
    end

end