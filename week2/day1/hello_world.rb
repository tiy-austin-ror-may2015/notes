puts "______________________\\"
puts "     GREETER 300000     "
puts "\\______________________"

prompt = "> "

print "What is ur name friend? #{prompt}"
name = gets.chomp

puts "Hello! #{name.upcase}, what a lovely name"

print "Where are you going? #{prompt}"
destination = gets

puts "So exciting, I love #{destination.chomp}, enjoy your trip!"
