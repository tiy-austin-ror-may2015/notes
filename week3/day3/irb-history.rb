load 'modules_part_deux.rb'

my_ride = Helicopter.new
puts my_ride.refuel

my_heli = HeliCarrier.new
puts my_heli.refuel
puts "look at the ancestors of the HeliCarrier"
puts HeliCarrier.ancestors.inspect
puts "They contain both modules that were mixed in"

puts TonkaTruck.ancestors

class User
  def unlock_doors
    if @admin == true
      puts 'unlocked the door'
    else
      puts 'permission denied'
    end
  end
end

justin = User.new
puts justin.unlock_doors


# The Admin class is a subclass of the user class. It inherits all of its methods, but sets the @admin flag to true
class Admin < User
  def initialize
    @admin = true
  end
end

me = Admin.new
puts me.unlock_doors

module Walking
  def walk
    puts "moves legs"
  end
end

#I "re-opened" the user class to include a module in it.
class User
  include Walking
end
puts justin.walk
