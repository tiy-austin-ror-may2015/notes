require 'test/unit'
# Directions:
# Write code which will be included in the human class which will give humans
# intelligent and bipedal behavior.

# WRITE YOUR CODE BELOW THIS COMMENT...

module Intelligent
  NUMBER_OF_BRAINS = 1
  def say_name
    "My name is #{@name}"
  end
  def number_of_brains
    NUMBER_OF_BRAINS
  end
end

#----

module Bipedal
  NUMBER_OF_LEGS = 2

  def run
    "Huff puff huff puff"
  end

  def number_of_legs
    NUMBER_OF_LEGS
  end
end

# ...AND ABOVE THIS COMMENT.  DO NOT EDIT THE HUMAN CLASS BELOW.

class Human
  include Intelligent
  include Bipedal

  def initialize(name)
    @name = name
  end
end

class IncludeChallenge < Test::Unit::TestCase

  def test_speaking
    assert_equal("My name is Zelda", Human.new("Zelda").say_name)
    assert_equal("My name is Mary", Human.new("Mary").say_name)
    assert_equal("My name is Amanda", Human.new("Amanda").say_name)
  end

# Uncomment each test after the one before it passes
  def test_running
    assert_equal("Huff puff huff puff", Human.new("Zelda").run)
    assert_equal("Huff puff huff puff", Human.new("Mary").run)
  end

  def test_constants
    assert_equal(2, Human::NUMBER_OF_LEGS)
    assert_equal(1, Human::NUMBER_OF_BRAINS)
  end

  def test_methods_to_get_constants_constants
    human = Human.new("Zelda")
    assert_equal(2, human.number_of_legs)
    assert_equal(1, human.number_of_brains)
  end

end
