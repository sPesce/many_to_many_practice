class Trip

    @@all = []
    attr_reader :tourist, :landmark
    def initialize(tourist,landmark)
        @tourist = tourist
        @landmark = landmark
        @@all << self
    end

    def self.all
        @@all
    end



end