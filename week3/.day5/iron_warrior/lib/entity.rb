class Entity
  attr_reader :x, :y, :char
  def initialize(x, y, char)
    @x = x; @y = y; @char = char
  end
end
