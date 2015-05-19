#!/usr/bin/env ruby
# ^ Tells the shell that this is a ruby file
# Dice Roller
class Dice

  def initialize(sides = 6)
    @sides = sides
  end

  def roll
    rand(1..@sides)
  end

end

puts "ARGV: #{ARGV.inspect}"
num_of_sides = ARGV.first.to_i

if num_of_sides.nil? || num_of_sides.zero?
  num_of_sides = 6
end

puts "You rolled: #{Dice.new(num_of_sides).roll}"








