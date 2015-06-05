class Entity
  attr_reader :x, :y, :char, :name
  def initialize(x, y, char, name = nil)
    @x = x; @y = y; @char = char
    @name = name || char
  end
end
