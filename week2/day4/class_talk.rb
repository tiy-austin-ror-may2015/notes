class Animal
  attr_accessor :name, :age, :coat

  def speak
    puts "grrrrr"
  end
end

class Dog < Animal
end

class Cat < Animal
  def purr
    puts "*ppprrrrrrrr*"
  end

  def speak
    puts "meow"
  end
end

class Kitten < Cat
  def speak
    puts "mew"
  end
end

my_cat = Cat.new

my_cat.speak





# LSP DEMO

class Rectangle
  def initialize(width, height)
    @width = width
    @height = height
  end

  def print
    "(#{width} x #{height})"
  end
end

class Square < Rectangle
  def initialize(width)
    @width  = width
    @height = width
  end
end





















