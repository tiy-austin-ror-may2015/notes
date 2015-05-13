class Cat
  attr_accessor :name, :age, :weight

  def initialize(name, age, weight)
    @name = name
    @age = age
    @weight = weight
  end

  def pooping
    puts "*uses litter box*"
  end

  def meow
    `say "meow"`
  end

  def destroy_furniture
    puts "*tears up couch*"
  end
end
