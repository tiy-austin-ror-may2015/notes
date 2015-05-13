class Player
  attr_accessor :deck, :name, :score

  def initialize
    @score = 0
  end

  def draw
    deck.draw
  end
end
