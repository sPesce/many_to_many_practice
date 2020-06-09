require_relative '../config/environment.rb'
def puts_ln
    puts "-----------------------"
end
puts "trip has a tourist and a landmark"
me      = Tourist.new("Me")
liberty = Landmark.new("Liberty Bell", "Philly")
me_lib = Trip.new(me,liberty)
puts me_lib.tourist.class == Tourist
puts me_lib.landmark.class == Landmark
puts_ln
puts "Landmark has a name and city"
puts "Name: ===#{liberty.name} ===#{liberty.name == "Liberty Bell"}==="
puts "City: ===#{liberty.city} ===#{liberty.city == "Philly"}==="
puts_ln
puts "Landmark has an @@all var"
wash_m = Landmark.new("Washington Monument","DC")
puts "Has first created obj?: ===#{Landmark.all[0] == liberty}==="
puts "Has length of 2?: ===#{Landmark.all.length == 2}==="
puts_ln
puts "Landmark#find_all_by_city:"
puts "has liberty bell?: ===#{Landmark.find_all_by_city("Philly")[0] == liberty}==="
love_park = Landmark.new("Love Park","Philly")
puts "finds multiple?; ===#{Landmark.find_all_by_city("Philly") == [liberty,love_park]}==="
puts_ln
puts "Landmark#tourists:"
puts "Returns array of one tourist when one tourist visited?: ===#{liberty.tourists==[me]}==="
bob = Tourist.new("Bob")
fred = Tourist.new("Fred")
bob_lib = Trip.new(bob,liberty)
fred_lib = Trip.new(fred,liberty)
puts "Returns list of tourists that visited?: ===#{liberty.tourists == [me,bob,fred]}==="
puts_ln
puts_ln
puts "=========Tourist====="
puts "Tourist.all:"
flag = Tourist.all & [bob,fred,me] == Tourist.all
puts "Tourist.all has 3 tourists added above?: ===#{flag}==="
puts "adding Mary"
mary = Tourist.new("Mary")
puts "Mary is included in all?: ===#{Tourist.all.include? mary}==="

puts_ln
puts "Tourist.find_by_name"
puts "find_by_name(\"mary\") = mary?: ===#{Tourist.find_by_name("Mary").name == "Mary"}==="
puts "returns error string with no match?: ===#{Tourist.find_by_name("noobin") == "Name not found"}==="

puts_ln
puts "Tourist#trips:"
puts "Can find bob's trip?: ===#{bob.trips == [bob_lib]}==="
puts "  Visit Landmark:"
puts "      bob visiting love park [2] will test both of these methods "
bob_love = bob.visit_landmark(love_park)
puts "[2]Can find both of bobs trips?: ===#{bob.trips == [bob_lib,bob_love]}==="
puts "Tourist#landmarks?:"
puts "Can find both of bobs' trip's landmarks: ===#{bob.landmarks == [liberty,love_park]}==="
puts "Can find my landmark?: ===#{me.landmarks == [liberty]}==="
puts_ln
puts "Tourist#never_visited:"
puts "Knows I never visited washington: ===#{me.never_visited.include? wash_m}==="
flag = true ##turns false if any tourists landmarks array contains any of their never_visited array
Tourist.all.each do |tourist|
    if tourist.landmarks & tourist.never_visited != []
        flag = false
    end
end
puts "never_visited and landmarks are mututally exclusive: ===#{flag}==="

#if there was any issue with trip, it would have broken on most of these tests
#so there are no tests for it
