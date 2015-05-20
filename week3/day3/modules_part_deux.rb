module TheIronYard
  module Austin
    module Rails
      STUDENT_COUNT = 10
    end
  end
  module Atlanta
    module Rails
      STUDENT_COUNT = 15
    end
  end
end

puts TheIronYard::Austin::Rails::STUDENT_COUNT
puts TheIronYard::Atlanta::Rails::STUDENT_COUNT

class Vehicle
  def drive
    puts "vroom vroom"
  end
end

class Truck < Vehicle
  def go_mudding
    @car_needs_bath = true
  end
  def beep_horn
    puts "*HOOONKKK*"
  end
end

class TonkaTruck < Truck
  def beep_horn
    puts "*beep-beep*"
  end
end

truck = Truck.new
truck.drive
truck.go_mudding

module Flying
  def takeoff
    @in_air = true
    puts "woooooshhh"
  end
  def land
    @in_air = false
    puts "pshhhhhh"
  end

  def refuel
    puts 'get jet fuel'
  end
end

module Carrier
  def load(goods)
    @hold.push(goods)
  end

  def unload
    @hold.pop
  end

  def refuel
    puts 'get cargo fuel'
  end
end

class MailTruck
  include Carrier
  def initialize
    @hold = Array.new
  end
end

mail_person = MailTruck.new

puts mail_person.load('My cool letter')

puts mail_person.unload

class Helicopter
  include Flying
end

class HeliCarrier
  include Carrier
  include Flying

  def initialize
    @hold = []
  end

  def refuel
    puts 'get helicarrier fuel'
  end
end

my_ride = Helicopter.new
my_ride.takeoff
my_ride.land












