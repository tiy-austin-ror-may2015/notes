class Hand
  attr_accessor :cards

  def initialize(starting_hand = Card.new)
    @cards = starting_hand
  end
end
